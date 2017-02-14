class Titolare < ActiveRecord::Base
  require 'codice_fiscale'
  attr_accessor :citta_nascita
  attr_accessor :sesso
  # Implementa IS-A da Utenti
  acts_as :utente
  belongs_to :citta
  # Validations necessarie per la registrazione
  validates :nome, :cognome, :email, :password, :citta_id, :password_confirmation, :telefono, :data_nascita, :cf, :indirizzo, :piva, presence: true
  validates_format_of :nome, :with => /\A([a-zA-Z '\-0-9òàùèé]+)$\z/, :message => "Sono permesse solo lettere da a-z, numeri 0-9, spazi, apostrofi, trattini."
  validates_format_of :cognome, :with => /\A([a-zA-Z '\-0-9òàùèé]+)$\z/, :message => "Sono permesse solo lettere da a-z, numeri 0-9, spazi, apostrofi, trattini."
  validates :email_paypal, email: true, :allow_blank => true
  validates_numericality_of :telefono
  validate :unique_entry #custom validation
  validate :check_CF,on: :create
  validate :check_indirizzo
  validates :sesso,:citta_nascita, presence: true, on: :create
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

  def check_CF
    unless Rails.env.test?
      if self.citta_nascita == '' || self.sesso == ''
        errors.add(:citta_nascita, "Inserire città di nascita")
      else
        if self.sesso=='M'
          sesso= :male
        else
          sesso= :female
        end
        citta = Citta.find(self.citta_nascita)
        nome_nuovo= ''+self.nome
        cognome_nuovo = ''+self.cognome
        codice= CodiceFiscale.calculate(
          :name          => nome_nuovo,
          :surname       => cognome_nuovo,
          :gender        => sesso,
          :birthdate     => self.data_nascita,
          :province_code => citta.provincia,
          :city_name     => citta.nome
        )
        puts(codice)
        if self.cf.upcase != codice
          errors.add(:cf,"Codice fiscale non valido.")
        end
      end
    end
  end

  def getIndirizzo
    self.indirizzo + ','+ self.citta.getNome
  end

  def check_indirizzo
    if self.indirizzo=='' || self.citta == nil
      errors.add(:indirizzo,"Indirizzo non valido")
    else
      coord = Geocoder.coordinates(self.getIndirizzo)
      if coord == nil
        errors.add(:indirizzo,"Indirizzo non valido")
      end
    end
  end

  def has_email_paypal
    self.email_paypal != ''
  end

end
