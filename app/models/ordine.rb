class Ordine < ActiveRecord::Base
  belongs_to :cliente
  belongs_to :impresa
  has_and_belongs_to_many :prodotti
  belongs_to :stato_ordine

  # Validations necessarie per la registrazione
  validates :cliente_id, :impresa_id, :stato_ordine_id, presence: true
  validate :has_prodotti #custom validation

  # Una relazione habtm ha bisogno di una custom validation
  def has_prodotti
    errors.add(:base, 'Un ordine deve contenere almeno un prodotto.') if self.prodotti.blank?
    #se non ci sono prodotti viene generato un errore
  end

  # Ritorna lo stato dell'ordine in forma di stringa
  def getStato
    stato_ordine.stato
  end

  # Necessario per mostrare il nome dell'Entita in RailsAdmin
  def name
    "#" + self.id.to_s + "Cliente: " + self.cliente_id.to_s
  end



end
