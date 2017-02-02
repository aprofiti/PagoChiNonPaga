class StatoOrdine < ActiveRecord::Base

  has_many :ordini


  # Validations necessarie per la registrazione
  validates :stato, presence: true
  validate :unique_entry #custom validation

  # Custom validation per controllare unicita tra piu campi senza case_sensitive
  def unique_entry
    matched_entry = StatoOrdine.where(['LOWER(stato) = LOWER(?)', self.stato]).first #il '?' e' un parametro per SQL passato da self.campo
    errors.add(:base, 'Stato già presente.') if matched_entry && (matched_entry.id != self.id) #se non sono io stesso allora c'e' un errore
  end

  # Necessario per mostrare il nome dell'Entita in RailsAdmin
  def name
    self.stato
  end

  def self.ATTESA
    StatoOrdine.find(1).stato
  end
  def self.CONFERMA
    StatoOrdine.find(2).stato
  end
  def self.PAGATO
    StatoOrdine.find(3).stato
  end
  def self.SPEDITO
    StatoOrdine.find(4).stato
  end
  def self.RICEVUTO
    StatoOrdine.find(5).stato
  end


end
