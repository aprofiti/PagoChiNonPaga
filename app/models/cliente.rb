class Cliente < ActiveRecord::Base
  # Implementa IS-A da Utenti
  acts_as :utente

  has_many :ordini
  belongs_to :indirizzo

end
