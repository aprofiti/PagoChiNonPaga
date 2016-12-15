class Indirizzo < ActiveRecord::Base
  belongs_to :citta
  has_many :clienti
  has_many :titolari

  # Validations necessarie per la registrazione
  validates :via, :ncivico, :cap, :citta_id, presence: true
  validate :unique_entry #custom validation

  # Custom validation per controllare unicita tra piu campi senza case_sensitive
  def unique_entry
    matched_entry = Indirizzo.where(['LOWER(via) = LOWER(?) AND ncivico=? AND cap=? AND citta_id=?',
      self.via, self.ncivico, self.cap, self.citta_id]).first #il '?' e' un parametro per SQL passato da self.campo
    errors.add(:base, 'Indirizzo già presente.') if matched_entry && (matched_entry.id != self.id) #se non sono io stesso allora c'e' un errore
  end

  def stampaIndirizzo()
    indirizzo = self.via.to_s + self.ncivico.to_s
  end

  # Necessario per mostrare il nome dell'Entita in RailsAdmin
  def name
    stampaIndirizzo()
  end

end
