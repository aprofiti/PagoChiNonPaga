class Prodotto < ActiveRecord::Base

  belongs_to :impresa
  has_and_belongs_to_many :ordini

end
