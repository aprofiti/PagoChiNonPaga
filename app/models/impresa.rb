class Impresa < ActiveRecord::Base
  belongs_to :titolare
  belongs_to :citta
  has_many :prodotti
  has_many :categorie
end
