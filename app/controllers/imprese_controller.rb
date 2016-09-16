class ImpreseController < ApplicationController
  before_action :set_impresa, only: [:show, :edit, :update, :destroy]

  # GET /imprese
  # GET /imprese.json
  def index
    @imprese = Impresa.all
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

  # POST /imprese
  # POST /imprese.json
  def create
    @impresa = Impresa.new(impresa_params)

    respond_to do |format|
      if @impresa.save
        format.html { redirect_to @impresa, notice: 'Impresa was successfully created.' }
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
        format.html { redirect_to @impresa, notice: 'Impresa was successfully updated.' }
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
    # Use callbacks to share common setup or constraints between actions.
    def set_impresa
      @impresa = Impresa.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def impresa_params
      params.require(:impresa).permit(:nome, :telefono, :fax, :giorni_orari, :email, :sitoweb, :facebook, :descrizione, :lat, :lng, :verificato, :congelato)
    end
end
