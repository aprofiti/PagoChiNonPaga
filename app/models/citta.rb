class Citta < ActiveRecord::Base
  belongs_to :polo
  has_many :imprese
  has_many :indirizzi

  # Ritorna la lista delle imprese registrate presso la citta
  def getImprese
    self.imprese
  end

  def getNome
    self.nome
  end

  # Necessario per mostrare il nome dell'Entita in RailsAdmin
  def name
    getNome
  end

end
