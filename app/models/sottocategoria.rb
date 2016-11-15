class Sottocategoria < ActiveRecord::Base

  belongs_to :categoria
  has_and_belongs_to_many :imprese

end
