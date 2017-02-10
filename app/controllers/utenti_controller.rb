class UtentiController < ApplicationController
  before_action :set_utente, only: [:show, :edit, :update, :destroy]
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_utente
      @utente = Utente.find(params[:id])
    end

    def utente_params
      params.require(:utente).permit(:nome, :cognome, :cf, :data_nascita, :telefono)
    end
end
