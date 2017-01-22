class Impresa < ActiveRecord::Base
  belongs_to :citta
  belongs_to :titolare
  has_many :prodotti
  has_many :ordini
  has_and_belongs_to_many :sottocategorie
  has_paper_trail
  geocoded_by :getIndirizzo
  after_validation :geocode
  # Validations necessarie per la registrazione
  validates :nome, :telefono, :email, :descrizione, :citta_id, :titolare_id, :indirizzo, presence: true
  validates_numericality_of :telefono, on: :create
  validates_numericality_of :fax, on: :create, :allow_blank => true
  validates_format_of :nome, :with => /\A[^\.]*\z/, :message => "non può avere all'interno il carattere '.'"
  validates :sitoweb, :format => URI::regexp(%w(http https)), :allow_blank => true
  validates :facebook, :format => URI::regexp(%w(http https)), :allow_blank => true
  validate :unique_entry #custom validation per l'unicita
  validate :has_sottocategoria #custom validation per la presenza di almeno una sottocategoria

  # Custom validation per controllare unicita tra piu campi senza case_sensitive
  def unique_entry
    matched_entry = Impresa.where([' LOWER(nome) = LOWER(?) AND LOWER(telefono) = LOWER(?) AND LOWER(email) = LOWER(?) AND titolare_id=? AND citta_id=?',
       self.nome, self.telefono, self.email, self.titolare_id, self.citta_id]).first #il '?' e' un parametro per SQL passato da self.campo
    errors.add(:base, 'Impresa già presente.') if matched_entry && (matched_entry.id != self.id) #se non sono io stesso allora c'e' un errore
  end

  # Custom validation per controllare la presenza di almeno una sottocategoria
  def has_sottocategoria
    err= self.sottocategorie.empty?
    errors.add(:base, 'Una impresa deve avere almeno una SOTTOCATEGORIA.') if err
  end

  def getNome
    self.nome
  end

  # Necessario per mostrare il nome dell'Entita in RailsAdmin
  def name
    getNome
  end

  def getTitolare
    self.titolare.getNome
  end

  def getCitta
    self.citta.getNome
  end

  def getIndirizzo
    self.indirizzo + ', ' + self.citta.getNome
  end

  def getCategorie
    categorie =[]
    self.sottocategorie.each do |sottocategoria|
      if !categorie.include?(sottocategoria.categoria.nome)
        categorie << sottocategoria.categoria.nome
      end
    end
    categorie
  end

  def getSottocategorie
    nomi=[]
    self.sottocategorie.each do |sottocategoria|
      nomi << [sottocategoria.nome, sottocategoria.categoria.nome]
    end
    nomi
  end

end
