class SottocategoriaController < ApplicationController
  before_action :set_sottocategorie, only: [:show, :edit, :update, :destroy]

  # GET /sottocategoria
  # GET /sottocategoria.json
  def index
    @sottocategoria = Sottocategorie.all
  end

  # GET /sottocategoria/1
  # GET /sottocategoria/1.json
  def show
  end

  # GET /sottocategoria/new
  def new
    @sottocategorie = Sottocategorie.new
  end

  # GET /sottocategoria/1/edit
  def edit
  end

  # POST /sottocategoria
  # POST /sottocategoria.json
  def create
    @sottocategorie = Sottocategorie.new(sottocategorie_params)

    respond_to do |format|
      if @sottocategorie.save
        format.html { redirect_to @sottocategorie, notice: 'Sottocategorie was successfully created.' }
        format.json { render :show, status: :created, location: @sottocategorie }
      else
        format.html { render :new }
        format.json { render json: @sottocategorie.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sottocategoria/1
  # PATCH/PUT /sottocategoria/1.json
  def update
    respond_to do |format|
      if @sottocategorie.update(sottocategorie_params)
        format.html { redirect_to @sottocategorie, notice: 'Sottocategorie was successfully updated.' }
        format.json { render :show, status: :ok, location: @sottocategorie }
      else
        format.html { render :edit }
        format.json { render json: @sottocategorie.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sottocategoria/1
  # DELETE /sottocategoria/1.json
  def destroy
    @sottocategorie.destroy
    respond_to do |format|
      format.html { redirect_to sottocategoria_url, notice: 'Sottocategorie was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sottocategorie
      @sottocategorie = Sottocategorie.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sottocategorie_params
      params.require(:sottocategorie).permit(:nome)
    end
end
