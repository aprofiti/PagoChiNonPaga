class Citta < ActiveRecord::Base

  has_many :titolari
  has_many :clienti
  has_many :indirizzi
  has_many :imprese

  belongs_to :polo

end
