class Impresa < ActiveRecord::Base
  belongs_to :citta
  belongs_to :titolare
  has_many :prodotti
  has_many :ordini
  has_and_belongs_to_many :sottocategorie

  # Necessario per mostrare il nome dell'Entita in RailsAdmin
  def name
    self.nome
  end

end
