class Sottocategoria < ActiveRecord::Base
  belongs_to :categoria
  has_and_belongs_to_many :imprese

  # Necessario per mostrare il nome dell'Entita in RailsAdmin
  def name
    self.nome
  end

end
