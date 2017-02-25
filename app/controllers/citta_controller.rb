=begin
Copyright 2017 Alessandro Profiti, Gabriele Restuccia, Lorenzo Ricelli.

This file is part of PagoChiNonPaga.

PagoChiNonPaga is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

PagoChiNonPaga is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.
=end

class CittaController < ApplicationController
  before_action :set_citta, only: [:show, :edit, :update, :destroy]
  before_filter :id_citta_match , only: :show
  # GET /citta
  # GET /citta.json
  def index
    @citta = Citta.all
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @citta }
     end
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
