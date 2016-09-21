class Titolare < ActiveRecord::Base
  acts_as :utente

  has_many :imprese
  belongs_to :citta
end
