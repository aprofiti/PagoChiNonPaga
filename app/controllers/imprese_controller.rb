class ImpreseController < ApplicationController
  before_action :set_impresa, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_utente! , except: [:index, :show]
  before_filter :controllo_titolare_impresa, only: [:edit,:destroy]
  before_filter :is_titolare, only: :new
  before_filter :id_nome_match, only: [:show,:edit]
  # GET /imprese
  # GET /imprese.json
  def index
    @imprese = Impresa.where(congelato: false, verificato: true)#Impresa.all  #SOLO IMPRESE NON CONGELATE O VERIFICATE
  end

  # GET /imprese/1
  # GET /imprese/1.json
  def show
  end

  # GET /imprese/new
  def new
    @impresa = Impresa.new
  end

  # GET /imprese/1/edit
  def edit
  end
  def autocomplete
    imprese = Impresa.all.map do |impresa|
      {
        nome: impresa.name,
      }
    end

    render json: imprese
  end
  # POST /imprese
  # POST /imprese.json
  def create
    @impresa = Impresa.new(impresa_params)
    @impresa.titolare_id = current_utente.actable_id
    respond_to do |format|
      if @impresa.save
        format.html { redirect_to impresa_path(nome: @impresa.nome,id: @impresa.id), notice: 'Impresa was successfully created.' }
        format.json { render :show, status: :created, location: @impresa }
      else
        format.html { render :new }
        format.json { render json: @impresa.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /imprese/1
  # PATCH/PUT /imprese/1.json
  def update
    respond_to do |format|
      if @impresa.update(impresa_params)
        format.html { redirect_to impresa_path(nome: @impresa.nome,id: @impresa.id), notice: 'Impresa was successfully updated.' }
        format.json { render :show, status: :ok, location: @impresa }
      else
        format.html { render :edit }
        format.json { render json: @impresa.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /imprese/1
  # DELETE /imprese/1.json
  def destroy
    @impresa.destroy
    respond_to do |format|
      format.html { redirect_to imprese_url, notice: 'Impresa was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def is_titolare
       if !(current_utente.isTitolare?)
         redirect_back
       end
    end

    def id_nome_match
      impresa= Impresa.find(params[:id].to_i)
      if impresa.nome != params[:nome]
        redirect_to(impresa_path(id: impresa.id,nome: impresa.nome))
      end
    end

    def controllo_titolare_impresa
      if !(current_utente.isMyImpresa?(@impresa))
        redirect_back
      end
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_impresa
      @impresa = Impresa.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def impresa_params
      params.require(:impresa).permit(:nome, :telefono, :fax, :giorni_orari, :email, :sitoweb, :facebook, :descrizione, :lat, :lng, :verificato, :congelato)
    end
end
