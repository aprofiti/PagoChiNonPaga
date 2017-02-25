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
