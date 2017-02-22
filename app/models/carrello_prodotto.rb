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
