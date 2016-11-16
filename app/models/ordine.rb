class Ordine < ActiveRecord::Base

  belongs_to :cliente
  belongs_to :impresa
  has_and_belongs_to_many :prodotti

end
