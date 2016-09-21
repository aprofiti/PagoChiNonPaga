class Ordine < ActiveRecord::Base

  has_many :prodotti
  belongs_to :cliente
  belongs_to :impresa
end
