class Impresa < ActiveRecord::Base

  belongs_to :citta
  belongs_to :titolare
  has_many :prodotti
  has_and_belongs_to_many :sottocategorie
  has_many :ordini
  
end
