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

class Carrello < ActiveRecord::Base
  # Gemma Carrello
  acts_as_shopping_cart_using :carrello_prodotti
  # Associo ogni carrello ad un cliente
  belongs_to :cliente

  validates :cliente_id, presence: true

  # Necessario per mostrare il nome dell'Entita in RailsAdmin
  def name
    cliente = self.cliente
    # Controllo che ci sia il record prima di visualizzare nel pannello
    if cliente != nil
      cliente.getNome
    end
  end

  # Ritorna lista imprese interessate nel carrello, richiamato in controller ordini
  def impreseCarrello
    imprese = []
    self.impresaElemento.each do |tupla|
      if !(imprese.include? tupla.at(0))
        imprese << tupla.at(0)
      end
    end
    imprese
  end

  # Ritorna lista prodotti carrello con [id_impresa, elemento], richiamato in impreseCarrello e in controller ordini
  def impresaElemento
    ids=[]
    self.cart_items.each do |elemento|
      prodotto = Prodotto.find(elemento.item_id)
      ids << [prodotto.impresa_id,elemento]
    end
    ids
  end

end
