class Titolare < ActiveRecord::Base
  # Implementa IS-A da Utenti
  acts_as :utente

  # Validations necessarie per la registrazione
  validates :nome, :cognome, :email, :password, :password_confirmation, :telefono, :data_nascita, :cf, presence: true
  #TODO: controllare presence indirizzo
  validates_numericality_of :telefono, on: :create
  validate :unique_entry #custom validation

  # Custom validation per controllare unicita tra piu campi senza case_sensitive
  def unique_entry
    matched_entry = Titolare.where(['LOWER(nome) = LOWER(?) AND LOWER(cognome) = LOWER(?) AND LOWER(cf) = LOWER(?) AND data_nascita=?',
       self.nome, self.cognome, self.cf, self.data_nascita]).first #il '?' e' un parametro per SQL passato da self.campo
    errors.add(:nome, 'Titolare già presente.') if matched_entry && (matched_entry.id != self.id) #se non sono io stesso allora c'e' un errore
  end

  has_many :imprese

  def getImprese
    self.imprese
  end

end
