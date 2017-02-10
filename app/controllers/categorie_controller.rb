class CategorieController < ApplicationController
  before_action :set_categoria, only: [:show, :edit, :update, :destroy]

  # GET /categorie
  # GET /categorie.json
  def index
    @categorie = Categoria.all
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_categoria
      @categoria = Categoria.find(params[:id])
    end

    def categoria_params
      params.require(:categoria).permit(:nome)
    end
end
