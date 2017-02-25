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

class CarrelloProdotto < ActiveRecord::Base
  # Gemma Carrello
  acts_as_shopping_cart_item_for :carrello
  validates_numericality_of :quantity, :greater_than => 0
  # Necessario per mostrare il nome dell'Entita in RailsAdmins
  def name
    id = self.item_id
    # Controllo che ci sia il record prima di visualizzare nel pannello
    if id != nil
      Prodotto.find(id).name
    end
  end

  def scalaQuantita
    quantita= self.quantity
    nuova_quantita= quantita.to_i-1
    if( nuova_quantita > 0)
      self.update_attribute('quantity',nuova_quantita)
    end
  end

  def aggiungiQuantita
    quantita= self.quantity
    nuova_quantita= quantita.to_i+1
    self.update_attribute('quantity',nuova_quantita)
  end

end
