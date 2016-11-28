class Polo < ActiveRecord::Base
  has_many :citta
  has_many :admins

  # Necessario per mostrare il nome dell'Entita in RailsAdmin
  def name
    self.nome
  end
  
end
