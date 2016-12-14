class Cliente < ActiveRecord::Base
  # Implementa IS-A da Utenti
  acts_as :utente

  # Relazioni per funzionalita di Ecommerce
  has_one :carrello
  has_many :ordini
  belongs_to :indirizzo

end
