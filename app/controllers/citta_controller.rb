class CittaController < ApplicationController
  before_action :set_citta, only: [:show, :edit, :update, :destroy]
  before_filter :id_citta_match , only: :show
  # GET /citta
  # GET /citta.json
  def index
    @citta = Citta.all
  end

  # GET /citta/:id
  # GET /citta/:id.json
  def show
  end


  private

    def id_citta_match
      citta = Citta.find(params[:id].to_i)
      if citta.nome != params[:nome]
        redirect_to(citta_path(nome: citta.nome, id: citta.id))
      end
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_citta
      @citta = Citta.find(params[:id])
    end

    def citta_params
      params.require(:citta).permit(:nome, :provincia, :regione)
    end
end
