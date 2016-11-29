class Categoria < ActiveRecord::Base
  has_many :sottocategorie

  # Necessario per mostrare il nome dell'Entita in RailsAdmin
  def name
    self.nome
  end
end
