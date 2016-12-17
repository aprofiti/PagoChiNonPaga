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

  def impreseCarrello  #lista imprese interessate nel carrello
    imprese = []
    self.impresaElemento.each do |tupla|
      if !(imprese.include? tupla.at(0))
        imprese << tupla.at(0)
      end
    end
    imprese
  end

  def impresaElemento #ritorna lista prodotti carrello con [id_impresa, elemento]
    ids=[]
    self.cart_items.each do |elemento|
      prodotto = Prodotto.find(elemento.item_id)
      ids << [prodotto.impresa_id,elemento]
    end
    ids
  end

  # Ritorna un array con i prodotti dell'impresa passata come parametro
  def impresaProdotti(impresaId)
    # Controllo il parametro
    if impresaId != nil
      # Ritorna array dei prodotti appartenenti all'impresa richiesta
      lista = self.impresaElemento()
      lista[impresaId]
      #lista = impresaElemento.find(impresaID)
    end
  end

end
