class Carrello < ActiveRecord::Base
  # Gemma Carrello
  acts_as_shopping_cart_using :carrello_prodotti
  # Associo ogni carrello ad un cliente
  belongs_to :cliente

  # Necessario per mostrare il nome dell'Entita in RailsAdmin
  def name
    cliente = self.cliente
    # Controllo che ci sia il record prima di visualizzare nel pannello
    if cliente != nil
      cliente.getNome
    end
  end

end
