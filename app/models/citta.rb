class Citta < ActiveRecord::Base

  # Validations necessarie per la registrazione
  validates :nome, :provincia, :regione, :polo_id, presence: true
  validate :unique_entry #custom validation


  belongs_to :polo
  has_many :imprese

  # Ritorna la lista delle imprese registrate presso la citta
  def getImprese
    self.imprese
  end

  # Custom validation per controllare unicita tra piu campi senza case_sensitive
  def unique_entry
    matched_entry = Citta.where(['LOWER(nome) = LOWER(?) AND LOWER(provincia) = LOWER(?) AND LOWER(regione) = LOWER(?)', self.nome, self.provincia, self.regione]).first
    errors.add(:base, 'Città già esistente') if matched_entry && (matched_entry.id != self.id)
  end

  def getNome
    self.nome
  end

  # Necessario per mostrare il nome dell'Entita in RailsAdmin
  def name
    getNome
  end

end
