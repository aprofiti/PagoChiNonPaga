class Impresa < ActiveRecord::Base
  belongs_to :citta
  belongs_to :titolare
  has_many :prodotti
  has_many :ordini
  has_and_belongs_to_many :sottocategorie

  # Validations necessarie per la registrazione
  validates :nome, :telefono, :email, :descrizione, :citta_id, :titolare_id, presence: true
  validate :unique_entry #custom validation

  # Custom validation per controllare unicita tra piu campi senza case_sensitive
  def unique_entry
    matched_entry = Impresa.where([' LOWER(nome) = LOWER(?) AND LOWER(telefono) = LOWER(?) AND LOWER(email) = LOWER(?) AND titolare_id=? AND citta_id=?',
       self.nome, self.telefono, self.email, self.titolare_id, self.citta_id]).first #il '?' e' un parametro per SQL passato da self.campo
    errors.add(:base, 'Impresa già presente.') if matched_entry && (matched_entry.id != self.id) #se non sono io stesso allora c'e' un errore
  end

  # Necessario per mostrare il nome dell'Entita in RailsAdmin
  def name
    self.nome
  end

  def getTitolare
    self.titolare.getNome
  end

  def getCitta
    self.citta.getNome
  end

  def getIndirizzo
    # TODO
  end

  def getCategorie
    # TODO
  end

  def getSottocategorie
    #self.sottocategoria
  end

end
