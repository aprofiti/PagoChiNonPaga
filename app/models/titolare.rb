class Titolare < ActiveRecord::Base
  # Implementa IS-A da Utenti
  acts_as :utente

  has_many :imprese
  belongs_to :indirizzo

  def getImprese
    self.imprese
  end

end
