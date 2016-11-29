class Prodotto < ActiveRecord::Base
  belongs_to :impresa
  has_and_belongs_to_many :ordini

  # Necessario per mostrare il nome dell'Entita in RailsAdmin
  def name
    self.nome
  end

end
