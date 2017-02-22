class Titolare < ActiveRecord::Base
  require 'codice_fiscale'
  has_paper_trail

  # Attributi per CF
  attr_accessor :sesso, :citta_nascita, :provincia_nascita
  # Attributi per indirizzo
  attr_accessor :locality

  # Implementa IS-A da Utenti
  acts_as :utente
  # Altre Relazioni
  belongs_to :citta
  has_many :imprese

  # Validations necessarie per la registrazione
  validates :nome, :cognome, :email, :password, :citta_id, :password_confirmation, :telefono, :data_nascita, :cf, :indirizzo, :piva, presence: true
  validates_format_of :nome, :with => /\A([a-zA-Z '\-0-9òàùèé]+)$\z/, :message => "Sono permesse solo lettere da a-z, numeri 0-9, spazi, apostrofi, trattini."
  validates_format_of :cognome, :with => /\A([a-zA-Z '\-0-9òàùèé]+)$\z/, :message => "Sono permesse solo lettere da a-z, numeri 0-9, spazi, apostrofi, trattini."
  validates :email_paypal, email: true, :allow_blank => true
  validate :unique_entry #custom validation
  validates_numericality_of :telefono
  # Validazioni per il Form
  validates :sesso,:citta_nascita,:provincia_nascita, presence: true, on: :create
  validates_length_of :provincia_nascita, :is => 2, on: :create
  validate :check_CF, on: :create
  # Validations per indirizzo
#  validates :locality, presence: true
  validate :check_indirizzo

  def check_CF
    # Non Controllo il CF durante i Test con Rspec
    unless Rails.env.test?
      # Richiamo il metodo della Superclasse Utente per calcolare il CF
      cf = self.acting_as.check_CF(self.nome,self.cognome,self.sesso,self.data_nascita,self.citta_nascita,self.provincia_nascita)
      # Controllo che il codice fiscale coincida con quello inserito dall'utente nel Form
      if self.cf != cf
        errors.add(:cf,"Codice Fiscale non corretto")
      end
    end
  end

  def check_indirizzo
    ret = Citta.trovaIndirizzo(self.getIndirizzo)
    puts(ret)
    if ret == nil
      errors.add(:indirizzo,"Indirizzo non valido")
    end
  end

  # Custom validation per controllare unicita tra piu campi senza case_sensitive
  def unique_entry
    matched_entry = Titolare.where(['LOWER(nome) = LOWER(?) AND LOWER(cognome) = LOWER(?) AND LOWER(cf) = LOWER(?) AND data_nascita=?',
       self.nome, self.cognome, self.cf, self.data_nascita]).first #il '?' e' un parametro per SQL passato da self.campo
    errors.add(:nome, 'Titolare già presente.') if matched_entry && (matched_entry.id != self.id) #se non sono io stesso allora c'e' un errore
  end

  def getNumImprese
    self.imprese.count
  end

  def getImprese
    self.imprese
  end

  def update_no_password_titolare(params)
    self.update_attribute('telefono',params[:telefono])
    self.update_attribute('indirizzo',params[:indirizzo])
    self.update_attribute('descrizione_indirizzo',params[:descrizione_indirizzo])
    self.update_attribute('piva',params[:piva])
    self.update_attribute('email_paypal',params[:email_paypal])
  end

  # Ritorna il numero totale di Utenti presenti dentro l'intero DB VERIFICATI
  def self.get_num_titolari
    Utente.where("actable_type= 'Titolare' AND confirmed_at NOT NULL").count
  end

  def getIndirizzo
    if(self.locality != nil)
      # E' stato ricavato da Google Place, quindi ha gia' la citta nell'indirizzo
      self.indirizzo
    else
      # Non e' stato ricavato tramite Google Place; aggiungo la citta alla fine dell'indirizzo
      "#{self.indirizzo}, #{self.citta.getNome}"
    end
  end

  def has_email_paypal
    self.email_paypal != ''
  end

end
