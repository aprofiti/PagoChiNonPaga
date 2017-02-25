=begin
Copyright 2017 Alessandro Profiti, Gabriele Restuccia, Lorenzo Ricelli.

This file is part of PagoChiNonPaga.

PagoChiNonPaga is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

PagoChiNonPaga is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.
=end

class Impresa < ActiveRecord::Base
  has_paper_trail
  # Attributi per indirizzo
  attr_accessor :route, :locality

  # Upload immagini
  mount_uploader :image, ImageUploader
  validate :file_size

  # Associazioni
  belongs_to :citta
  belongs_to :titolare
  has_many :prodotti
  has_many :ordini
  has_and_belongs_to_many :sottocategorie


  geocoded_by :getIndirizzo
  after_validation :geocode

  # Validations necessarie per la registrazione
  validates :nome, :telefono, :email, :descrizione, :citta_id, :titolare_id, :indirizzo, presence: true
  validates_numericality_of :telefono
  validates_numericality_of :fax, :allow_blank => true
  validates_format_of :nome, :with => /\A([a-zA-Z '\-0-9òàùèé]+)$\z/, :message => "Sono permesse solo lettere da a-z, numeri 0-9, spazi, apostrofi, trattini."
  validates :sitoweb, :format => URI::regexp(%w(http https)), :allow_blank => true
  validates :facebook, :format => URI::regexp(%w(http https)), :allow_blank => true
  validate :unique_entry #custom validation per l'unicita
  validate :has_sottocategoria #custom validation per la presenza di almeno una sottocategoria
  validates :email, email: true
  # Validations per indirizzo
  validate :check_indirizzo

  def check_indirizzo
    return false unless self.errors.empty?
    # Se ho il campo locality allora ho selezionato l'indirizzo tramite l'autocomplete di Google Place
    if(self.locality != "")
      # Controllo che la citta' dell'indirizzo selezionato, corrisponda alla Citta nel menu a tendina
      if (self.locality != self.citta.getNome)
        errors.add(:citta_id,"L'indirizzo non corrisponde con la citta selezionata")
      end
      # Controllo che la citta' dell'indirizzo selezionato, corrisponda alla Citta nel menu a tendina
      if (self.route == "")
        errors.add(:indirizzo,"L'indizzo immesso non e' una via; oppure un Punto di Interesse con indirizzo")
      end
    end
    # Controllo l'esistenza dell'indirizzo tramite Google Place API
    ret = Citta.trovaIndirizzo(self.getIndirizzo)
    if ret == nil
      errors.add(:indirizzo,"Indirizzo non valido")
    end
  end

  def file_size
    max_file_size_mb= 5
    if self.image?
      if image.file.size.to_f/(1000*1000) > max_file_size_mb
        errors.add(:image, "La dimensione dell'immagine (in megabyte) è troppo grande.")
      end
    end
  end

  # Custom validation per controllare la presenza di almeno una sottocategoria
  def has_sottocategoria
    err= self.sottocategorie.empty?
    errors.add(:base, 'Una impresa deve avere almeno una SOTTOCATEGORIA.') if err
  end

  # Custom validation per controllare unicita tra piu campi senza case_sensitive
  def unique_entry
    matched_entry = Impresa.where([' LOWER(nome) = LOWER(?) AND LOWER(telefono) = LOWER(?) AND LOWER(email) = LOWER(?) AND titolare_id=? AND citta_id=?',
       self.nome, self.telefono, self.email, self.titolare_id, self.citta_id]).first #il '?' e' un parametro per SQL passato da self.campo
    errors.add(:base, 'Impresa già presente.') if matched_entry && (matched_entry.id != self.id) #se non sono io stesso allora c'e' un errore
  end

  #
  # Metodi della Classe
  #

  # Ritorna il numero totale di imprese presenti in tutto il DB che sono verificate e NON congelate
  def self.get_num_imprese
    Impresa.where(:congelato=>false, :verificato=>true).count
  end

  # Ritorna un array di max 5 imprese presenti nel DB verificate e NON congelate
  def self.get_random_imprese
    imprese= Impresa.where(:congelato=>false, :verificato=>true)
    imprese.sample(5)
  end

  #
  # Metodi di Istanza
  #

  def isAttiva?
    self.isVerificata? && !self.isCongelata?
  end

  def isVerificata?
    self.verificato
  end

  def isCongelata?
    self.congelato
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
    if(self.locality != "" || self.citta == nil)
      # E' stato ricavato da Google Place, quindi ha gia' la citta nell'indirizzo
      self.indirizzo
    else
      # Non e' stato ricavato tramite Google Place; aggiungo la citta alla fine dell'indirizzo
      "#{self.indirizzo}, #{self.citta.getNome}"
    end
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
