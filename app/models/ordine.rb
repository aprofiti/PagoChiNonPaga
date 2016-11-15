class Ordine < ActiveRecord::Base

  belongs_to :cliente
  belongs_to :impresa
  has_many :prodotti

end
