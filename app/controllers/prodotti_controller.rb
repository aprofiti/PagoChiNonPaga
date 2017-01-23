class ProdottiController < ApplicationController
  before_action :set_prodotto, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_utente!, only: [:new, :edit]
  before_filter :id_index_match, only: :index
  before_filter :prodotto_impresa_match , only: [:show, :edit]
  before_filter :impresa_abilitata , only: [:show, :edit,:destroy,:update]
  # GET /prodotti
  # GET /prodotti.json
  def index       #rotta rimossa
    impresa= Impresa.find(params[:id].to_i)     #prima di index controllo che l'id inserito corrisponda a una impresa verificata e NON congelata
    if !(impresa.verificato && !(impresa.congelato))
      redirect_back
    else
      @prodotti = Prodotto.all
    end
  end

  # GET /prodotti/1
  # GET /prodotti/1.json
  def show
  end

  # GET /prodotti/new
  def new
   imp_list = Impresa.where(titolare_id: current_utente.actable_id).select("id") #imp_list contiene lista imprese del titolare loggato
   if !(current_utente.actable_type == "Titolare" && (imp_list.ids.include? params[:id].to_i ))  #se l'impresa attuale non è sua ho redirect
     redirect_back
   end
    @prodotto = Prodotto.new
  end

  # GET /prodotti/1/edit
  def edit
   imp_list = Impresa.where(titolare_id: current_utente.actable_id).select("id")
   if !(current_utente.actable_type == "Titolare" && (imp_list.ids.include? @prodotto.impresa_id.to_i ))
     redirect_back
   end
  end

  # POST /prodotti
  # POST /prodotti.json
  def create
    @prodotto = Prodotto.new(prodotto_params)
    @prodotto.impresa_id= params[:id]
    respond_to do |format|
      if @prodotto.save
        format.html { redirect_to impresa_prodotti_path(id: @prodotto.impresa_id ), notice: 'Prodotto was successfully created.' }
        format.json { render :show, status: :created, location: @prodotto }
      else
        format.html { render :new }
        format.json { render json: @prodotto.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /prodotti/1
  # PATCH/PUT /prodotti/1.json
  def update
    respond_to do |format|
      if @prodotto.update(prodotto_params)
        format.html { redirect_to impresa_prodotti_path(id: @prodotto.impresa_id ), notice: 'Prodotto was successfully updated.' }
        format.json { render :show, status: :ok, location: @prodotto }
      else
        format.html { render :edit }
        format.json { render json: @prodotto.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /prodotti/1
  # DELETE /prodotti/1.json
  def destroy
    @prodotto.destroy
    respond_to do |format|
      format.html { redirect_to impresa_prodotti_path(id: @prodotto.impresa_id ), notice: 'Prodotto was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def id_index_match
      impresa = Impresa.find(params[:id].to_i)
      if impresa.nome != params[:impresa_nome]
        redirect_to(impresa_prodotti_path(impresa_nome: impresa.nome, id: impresa.id))
      end
    end
    def prodotto_impresa_match
      prodotto = Prodotto.find(params[:id_p])
      if prodotto.nome != params[:nome] || prodotto.impresa.nome != params[:impresa_nome]
        redirect_to( impresa_prodotto_path(impresa_nome: prodotto.impresa.nome, id_p: prodotto.id, nome: prodotto.nome))
      end
    end

    def impresa_abilitata #impresa deve essere verificata e NON congelata
      if !(@prodotto.impresa.verificato && !(@prodotto.impresa.congelato))
        redirect_back
      end
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_prodotto
      @prodotto = Prodotto.find(params[:id_p])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def prodotto_params
      params.require(:prodotto).permit(:nome, :prezzo, :qta, :descrizione,:impresa_id)
    end
end
