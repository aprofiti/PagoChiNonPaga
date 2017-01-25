class Cliente < ActiveRecord::Base
  # Implementa IS-A da Utenti
  acts_as :utente
  # Relazioni per funzionalita di Ecommerce
  has_one :carrello
  has_many :ordini
  belongs_to :citta
  # Validations necessarie per la registrazione
  validates :nome, :cognome, :data_nascita, :cf, :telefono, :email, :password, :password_confirmation, :indirizzo, :citta_id, presence: true
  validate :unique_entry #custom validation
  validates_numericality_of :telefono, on: :create

  # Custom validation per controllare unicita tra piu campi senza case_sensitive
  def unique_entry
    matched_entry = Cliente.where(['LOWER(nome) = LOWER(?) AND LOWER(cognome) = LOWER(?) AND LOWER(cf) = LOWER(?) AND data_nascita=?',
       self.nome, self.cognome, self.cf, self.data_nascita]).first #il '?' e' un parametro per SQL passato da self.campo
    errors.add(:nome, 'Cliente già presente.') if matched_entry && (matched_entry.id != self.id) #se non sono io stesso allora c'e' un errore
    #utilizzare :nome è un workaround per visualizzare un messaggio custom di errore alla registrazione.
    #per l'email ci pensa devise
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

end
