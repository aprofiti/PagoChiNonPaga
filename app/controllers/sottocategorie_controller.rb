class SottocategorieController < ApplicationController
  before_action :set_sottocategoria, only: [:show, :edit, :update, :destroy]

  # GET /sottocategorie
  # GET /sottocategorie.json
  def index

    categoria = Categoria.where(nome: params[:categoria_nome]).first #Ritorna categoria con il nome nell'URL (first perchè è una sola)
    @sottocategorie = Sottocategoria.where(categoria_id: categoria.id)#Ritorna tutte le sottocategorie della categoria trovata sopra

  end

  # GET /sottocategorie/1
  # GET /sottocategorie/1.json
  def show
  end


  # POST /sottocategorie
  # POST /sottocategorie.json
  def create
    @sottocategoria = Sottocategoria.new(sottocategoria_params)

    respond_to do |format|
      if @sottocategoria.save
        format.html { redirect_to @sottocategoria, notice: 'Sottocategoria was successfully created.' }
        format.json { render :show, status: :created, location: @sottocategoria }
      else
        format.html { render :new }
        format.json { render json: @sottocategoria.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sottocategorie/1
  # PATCH/PUT /sottocategorie/1.json
  def update
    respond_to do |format|
      if @sottocategoria.update(sottocategoria_params)
        format.html { redirect_to @sottocategoria, notice: 'Sottocategoria was successfully updated.' }
        format.json { render :show, status: :ok, location: @sottocategoria }
      else
        format.html { render :edit }
        format.json { render json: @sottocategoria.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sottocategorie/1
  # DELETE /sottocategorie/1.json
  def destroy
    @sottocategoria.destroy
    respond_to do |format|
      format.html { redirect_to sottocategorie_url, notice: 'Sottocategoria was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sottocategoria
      @sottocategoria = Sottocategoria.find_by(nome: params[:nome])   #modificato perchè ora cerco per nome e non per id
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sottocategoria_params
      params.require(:sottocategoria).permit(:nome)
    end
end
