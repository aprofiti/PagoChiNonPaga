class SottocategorieController < ApplicationController
  before_action :set_sottocategoria, only: [:show, :edit, :update, :destroy]

  # GET /categorie/:categoria_nome/sottocategorie?id=id_categoria
  # GET /categorie/:categoria_nome/sottocategorie.json?id=id_categoria
  def index
    categoria = Categoria.where(nome: params[:categoria_nome]).first #Ritorna categoria con il nome nell'URL (first perchè è una sola)
    @sottocategorie = Sottocategoria.where(categoria_id: categoria.id)#Ritorna tutte le sottocategorie della categoria trovata sopra
  end

  # GET /categorie/:categoria_nome/sottocategorie/:nome?id=id_categoria
  # GET /categorie/:categoria_nome/sottocategorie/:nome.json?id=id_categoria
  def show
  end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sottocategoria
      @sottocategoria = Sottocategoria.find_by(nome: params[:nome])   #modificato perchè ora cerco per nome e non per id
    end

    def sottocategoria_params
      params.require(:sottocategoria).permit(:nome)
    end
end
