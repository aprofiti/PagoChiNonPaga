class OrdiniController < ApplicationController
  before_action :set_ordine, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_utente!
  before_filter :is_mio_ordine?, only: [:show,:edit,:destroy]
  # GET /ordini
  # GET /ordini.json
  def index
    if current_utente.actable_type == "Cliente"
      @ordini = Cliente.find(current_utente.actable_id).ordini
    elsif current_utente.actable_type == "Titolare"
      imp_list = Impresa.where(titolare_id: current_utente.actable_id).select("id") #Ritorna array di imprese del titolare loggato, con i soli id
      @ordini= Ordine.where(imp_list.ids.include? :impresa_id) #Ritorna tutti gli ordini che appartengono a una impresa con id presente nell'array precedente
    end
  end

  # GET /ordini/1
  # GET /ordini/1.json
  def show

  end

  # GET /ordini/new
  def new #path disabilitato perchè l'ordine si crea cliccando submit su lista e non da url compilando a mano
    @ordine = Ordine.new
  end

  # GET /ordini/1/edit
  def edit
  end

  # POST /ordini
  # POST /ordini.json
  def create
    @ordine = Ordine.new(ordine_params)

    respond_to do |format|
      if @ordine.save
        format.html { redirect_to @ordine, notice: 'Ordine was successfully created.' }
        format.json { render :show, status: :created, location: @ordine }
      else
        format.html { render :new }
        format.json { render json: @ordine.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ordini/1
  # PATCH/PUT /ordini/1.json
  def update
    respond_to do |format|
      if @ordine.update(ordine_params)
        format.html { redirect_to @ordine, notice: 'Ordine was successfully updated.' }
        format.json { render :show, status: :ok, location: @ordine }
      else
        format.html { render :edit }
        format.json { render json: @ordine.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ordini/1
  # DELETE /ordini/1.json
  def destroy
    @ordine.destroy
    respond_to do |format|
      format.html { redirect_to ordini_url, notice: 'Ordine was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  def is_mio_ordine?
    if(current_utente.isCliente? && @ordine.cliente_id == current_utente.actable_id)
    elsif (current_utente.isTitolare? && current_utente.isMyImpresa?(Impresa.find(@ordine.impresa_id)))
    else redirect_back
    end
  end
    # Use callbacks to share common setup or constraints between actions.
    def set_ordine
      @ordine = Ordine.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ordine_params
      params.require(:ordine).permit(:data, :stato)
    end
end
