class Cliente < ActiveRecord::Base
  acts_as :utente

  has_many :ordini
  belongs_to :indirizzo

end
