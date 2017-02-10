class PoliController < ApplicationController
  before_action :set_polo, only: [:show, :edit, :update, :destroy]

  # GET /poli
  # GET /poli.json
  def index
    @poli = Polo.all
  end

  # GET /poli/:nome
  # GET /poli/:nome.json
  def show
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_polo
      @polo = Polo.find_by(nome: params[:nome])
    end

    def polo_params
      params.require(:polo).permit(:nome)
    end
end
