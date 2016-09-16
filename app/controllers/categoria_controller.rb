class CategoriaController < ApplicationController
  before_action :set_categorie, only: [:show, :edit, :update, :destroy]

  # GET /categoria
  # GET /categoria.json
  def index
    @categoria = Categorie.all
  end

  # GET /categoria/1
  # GET /categoria/1.json
  def show
  end

  # GET /categoria/new
  def new
    @categorie = Categorie.new
  end

  # GET /categoria/1/edit
  def edit
  end

  # POST /categoria
  # POST /categoria.json
  def create
    @categorie = Categorie.new(categorie_params)

    respond_to do |format|
      if @categorie.save
        format.html { redirect_to @categorie, notice: 'Categorie was successfully created.' }
        format.json { render :show, status: :created, location: @categorie }
      else
        format.html { render :new }
        format.json { render json: @categorie.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /categoria/1
  # PATCH/PUT /categoria/1.json
  def update
    respond_to do |format|
      if @categorie.update(categorie_params)
        format.html { redirect_to @categorie, notice: 'Categorie was successfully updated.' }
        format.json { render :show, status: :ok, location: @categorie }
      else
        format.html { render :edit }
        format.json { render json: @categorie.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /categoria/1
  # DELETE /categoria/1.json
  def destroy
    @categorie.destroy
    respond_to do |format|
      format.html { redirect_to categoria_url, notice: 'Categorie was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_categorie
      @categorie = Categorie.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def categorie_params
      params.require(:categorie).permit(:nome)
    end
end
