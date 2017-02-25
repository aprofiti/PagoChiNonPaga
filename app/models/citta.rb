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

class Citta < ActiveRecord::Base
  has_paper_trail
  #Associazioni
  belongs_to :polo
  has_many :imprese

  # Validations necessarie per la registrazione
  validates :nome, :provincia, :regione, :polo_id, presence: true
  validate :unique_entry #custom validation

  # Custom validation per controllare unicita tra piu campi senza case_sensitive
  def unique_entry
    matched_entry = Citta.where(['LOWER(nome) = LOWER(?) AND LOWER(provincia) = LOWER(?) AND LOWER(regione) = LOWER(?)', self.nome, self.provincia, self.regione]).first
    errors.add(:base, 'Città già esistente') if matched_entry && (matched_entry.id != self.id)
  end

  #
  # Metodi della Classe
  #

  # Aggiunge una nuova Citta al DB
  # Qualora si volesse popolare automaticamente il DB con le Citta',
  # puo' essere richiamata all momento della compilazione del Form di registrazione nei controller di Cliente, Titolare e Impresa.
  def self.aggiungi(nome, provincia, regione)
    if nome.empty? || regione.empty? || provincia.empty?
      return nil
    end
    # Controllo se e' gia' presente la Citta nel DB
    citta = Citta.where(nome: nome)
    if citta.exists?
      return citta[0]
    else
      # Decido a quale polo assegnarla
      citta_provincia = Citta.find_by_provincia(provincia)
      if citta_provincia == nil
        # Non esiste nessuna città con quella provincia quindi nemmeno il polo
        # Assegno a Palermo
        polo = Citta.find_by_nome('Palermo').polo
      else
        # È di una provincia già esistente
        polo = citta_provincia.polo
      end
      # Aggiunto la citta nel DB
      citta = Citta.create(nome: nome,regione: regione,provincia: provincia,polo_id: polo.id)
      citta.save
      return citta
    end
  end

  # Utilizza Google Maps per verificare se un indirizzo risulti valido
  def self.trovaIndirizzo(indirizzo)
    if indirizzo == ""
      return nil
    end
    # Verifico se le API Google mi restituiscono delle coordinate valide
    coord = Geocoder.coordinates(indirizzo)
    if coord == nil
      # Nessuna corrispondenza
      return nil
    end
    return coord
  end

  #
  # Metodi di Istanza
  #

  # Ritorna la lista delle imprese registrate presso la citta
  def getImprese
    self.imprese
  end

  def getProvincia
    self.provincia
  end

  def getNome
    self.nome
  end

  # Necessario per mostrare il nome dell'Entita in RailsAdmin
  def name
    getNome
  end

end
