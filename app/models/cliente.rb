class Cliente < ActiveRecord::Base
  require 'codice_fiscale'
  attr_accessor :citta_nascita
  attr_accessor :sesso

  # Implementa IS-A da Utenti
  acts_as :utente
  # Relazioni per funzionalita di Ecommerce
  has_one :carrello
  has_many :ordini
  belongs_to :citta
  # Validations necessarie per la registrazione
  validates :citta_nascita,:sesso,:nome, :cognome, :data_nascita, :cf, :telefono, :email, :password, :password_confirmation, :indirizzo, :citta_id, presence: true
  validates_format_of :nome, :with => /\A([a-zA-Z '\-0-9òàùèé]+)$\z/, :message => "Sono permesse solo lettere da a-z, numeri 0-9, spazi, apostrofi, trattini."
  validates_format_of :cognome, :with => /\A([a-zA-Z '\-0-9òàùèé]+)$\z/, :message => "Sono permesse solo lettere da a-z, numeri 0-9, spazi, apostrofi, trattini."
  validate :unique_entry #custom validation
  validates_numericality_of :telefono
  validate :check_CF ,on: :create
  validate :check_indirizzo

  def unique_entry
    matched_entry = Cliente.where(['LOWER(nome) = LOWER(?) AND LOWER(cognome) = LOWER(?) AND LOWER(cf) = LOWER(?) AND data_nascita=?',
       self.nome, self.cognome, self.cf, self.data_nascita]).first #il '?' e' un parametro per SQL passato da self.campo
    errors.add(:nome, 'Cliente già presente.') if matched_entry && (matched_entry.id != self.id) #se non sono io stesso allora c'e' un errore
    #utilizzare :nome è un workaround per visualizzare un messaggio custom di errore alla registrazione.
    #per l'email ci pensa devise
  end

  # Usato da cancancan per i permessi Admin
  def is_my_polo?(user_polo_id)
    user_polo_id==self.citta.polo.id
  end

  # Restituisce tutti gli ordini del Cliente
  def getOrdini
    self.ordini
  end

  # Restituisce una array con gli ordini del Cliente che non sono ancora stati completati
  def getOrdiniAttivi
    ordini = []
    # Controllo lo stato di ogni ordine
    self.ordini.each do |ordine|
      if ordine.getStato != "Ricevuto"
        # Aggiungo all'array
        ordini << ordine
      end
    end
    ordini
  end

  def update_no_password_cliente(params)
    self.assign_attributes('telefono' => params[:telefono])
    self.assign_attributes('indirizzo' => params[:indirizzo])
    self.update_attribute('descrizione_indirizzo',params[:descrizione_indirizzo])
  end

  # Ritorna il numero totale di Clienti (sostenitori) all'interno di tutto il DB VERIFICATI
  def self.get_num_clienti
    Utente.where("actable_type= 'Cliente' AND confirmed_at NOT NULL").count
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
end
