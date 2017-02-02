class Titolare < ActiveRecord::Base
  # Implementa IS-A da Utenti
  acts_as :utente
  belongs_to :citta
  # Validations necessarie per la registrazione
  validates :nome, :cognome, :email, :password, :citta_id, :password_confirmation, :telefono, :data_nascita, :cf, :indirizzo, presence: true
  validates_format_of :nome, :with => /\A([a-zA-Z '\-0-9òàùèé]+)$\z/, :message => "Sono permesse solo lettere da a-z, numeri 0-9, spazi, apostrofi, trattini."
  validates_format_of :cognome, :with => /\A([a-zA-Z '\-0-9òàùèé]+)$\z/, :message => "Sono permesse solo lettere da a-z, numeri 0-9, spazi, apostrofi, trattini."
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

  # Ritorna il numero totale di Utenti presenti dentro l'intero DB VERIFICATI
  def self.get_num_titolari
    Utente.where("actable_type= 'Titolare' AND confirmed_at NOT NULL").count
  end

end
