class ProdottiController < ApplicationController
  before_action :set_prodotto, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_utente!, only: [:new, :edit]
  before_filter :is_titolare_impresa, only: [:new,:edit]

  # GET /prodotti
  # GET /prodotti.json
  def index       #rotta rimossa
    @prodotti = Prodotto.all
  end

  # GET /prodotti/1
  # GET /prodotti/1.json
  def show
  end

  # GET /prodotti/new
  def new
    @prodotto = Prodotto.new
  end

  # GET /prodotti/1/edit
  def edit
  end

  # POST /prodotti
  # POST /prodotti.json
  def create
    @prodotto = Prodotto.new(prodotto_params)
    @prodotto.impresa_id= params[:id]
    respond_to do |format|
      if @prodotto.save
        format.html { redirect_to root_path, notice: 'Prodotto was successfully created.' }
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
      format.html { redirect_to prodotti_url, notice: 'Prodotto was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private


  def is_titolare_impresa
      imp_list = Impresa.where(titolare_id: current_utente.actable_id).select("id")
     if !(current_utente.actable_type == "Titolare" && (imp_list.ids.include? params[:id] ))
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
