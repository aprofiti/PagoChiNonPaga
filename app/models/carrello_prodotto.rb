class CarrelloProdotto < ActiveRecord::Base
  # Gemma Carrello
  acts_as_shopping_cart_item_for :carrello

  # Necessario per mostrare il nome dell'Entita in RailsAdmins
  def name
    id = self.item_id
    # Controllo che ci sia il record prima di visualizzare nel pannello
    if id != nil
      Prodotto.find(id).name
    end
  end

end
