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
