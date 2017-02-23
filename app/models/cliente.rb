class Cliente < ActiveRecord::Base
  require 'codice_fiscale'
  # Attributi per CF
  attr_accessor :sesso, :citta_nascita, :provincia_nascita
  # Attributi per indirizzo
  attr_accessor :route, :locality

  # Implementa IS-A da Utenti
  acts_as :utente
  # Relazioni per funzionalita di Ecommerce
  has_one :carrello
  has_many :ordini
  belongs_to :citta

  # Validations necessarie per la registrazione
  validates :nome, :cognome, :data_nascita, :cf, :telefono, :email, :password, :password_confirmation, :indirizzo, :citta_id, presence: true
  validates_format_of :nome, :with => /\A([a-zA-Z '\-0-9òàùèé]+)$\z/, :message => "Sono permesse solo lettere da a-z, numeri 0-9, spazi, apostrofi, trattini."
  validates_format_of :cognome, :with => /\A([a-zA-Z '\-0-9òàùèé]+)$\z/, :message => "Sono permesse solo lettere da a-z, numeri 0-9, spazi, apostrofi, trattini."
  validate :unique_entry #custom validation
  validates_numericality_of :telefono
  # Validazioni per il Form
  validates :sesso, :citta_nascita, :provincia_nascita, presence: true, on: :create
  validates_length_of :provincia_nascita, :is => 2, on: :create
  validate :check_CF, on: :create
  # Validations per indirizzo
  #validates :locality, presence: true
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
      puts(cf)
    end
  end

  def check_indirizzo
    # Se ho il campo locality allora ho selezionato l'indirizzo tramite l'autocomplete di Google Place
    if(self.locality != "")
      # Controllo che la citta' dell'indirizzo selezionato, corrisponda alla Citta nel menu a tendina
      if (self.locality != self.citta.getNome)
        errors.add(:citta_id,"L'indirizzo non corrisponde con la citta selezionata")
      end
      # Controllo che la citta' dell'indirizzo selezionato, corrisponda alla Citta nel menu a tendina
      if (self.route == "")
        errors.add(:indirizzo,"L'indizzo immesso non e' una via oppure un Punto di Interesse con indirizzo")
      end
    end
    # Controllo l'esistenza dell'indirizzo tramite Google Place API
    ret = Citta.trovaIndirizzo(self.getIndirizzo)
    if ret == nil
      errors.add(:indirizzo,"Indirizzo non valido")
    end
  end

  def unique_entry
    matched_entry = Cliente.where(['LOWER(nome) = LOWER(?) AND LOWER(cognome) = LOWER(?) AND LOWER(cf) = LOWER(?) AND data_nascita=?',
       self.nome, self.cognome, self.cf, self.data_nascita]).first #il '?' e' un parametro per SQL passato da self.campo
    errors.add(:nome, 'Cliente già presente.') if matched_entry && (matched_entry.id != self.id) #se non sono io stesso allora c'e' un errore
    #utilizzare :nome è un workaround per visualizzare un messaggio custom di errore alla registrazione.
    #per l'email ci pensa devise
  end

  # Usato da cancancan per i permessi Admin
  def is_my_polo?(user_polo_id)
    user_polo_id == self.citta.polo.id
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
    Utente.where("actable_type = ?", "Cliente").where("created_at != ?", nil).count
  end

  def getIndirizzo
    if(self.locality != "")
      # E' stato ricavato da Google Place, quindi ha gia' la citta nell'indirizzo
      self.indirizzo
    else
      # Non e' stato ricavato tramite Google Place; aggiungo la citta alla fine dell'indirizzo
      "#{self.indirizzo}, #{self.citta.getNome}"
    end
  end

end
