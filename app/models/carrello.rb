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
