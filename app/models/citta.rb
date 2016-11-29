class Citta < ActiveRecord::Base
  belongs_to :polo
  has_many :imprese
  has_many :indirizzi

  # Necessario per mostrare il nome dell'Entita in RailsAdmin
  def name
    self.nome
  end
end
