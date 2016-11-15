class Indirizzo < ActiveRecord::Base

  belongs_to :citta
  has_many :clienti
  has_many :titolari

end
