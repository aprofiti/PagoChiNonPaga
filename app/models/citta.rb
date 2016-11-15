class Citta < ActiveRecord::Base

  belongs_to :polo
  has_many :imprese
  has_many :indirizzi

end
