class Ordine < ActiveRecord::Base
  belongs_to :cliente
  belongs_to :impresa
  has_and_belongs_to_many :prodotti

  def getOrdini
  #  @ordini.where("cliente_id = " + utente.actable_id.to_s + "")
  #  @ordini.where("cliente_id = 1")
  end

  # Necessario per mostrare il nome dell'Entita in RailsAdmin
  def name
    "#" + self.id.to_s + "Cliente: " + self.cliente_id.to_s
  end



end
