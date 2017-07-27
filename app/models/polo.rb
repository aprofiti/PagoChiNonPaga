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

class Polo < ActiveRecord::Base
  has_many :citta
  has_many :admins

  # Validations necessarie per la registrazione
  validates :nome, presence: true
  validates_format_of :nome, :with => /\A([a-zA-Z '\-0-9òàùèé]+)$\z/, :message => "Sono permesse solo lettere da a-z, numeri 0-9, spazi, apostrofi, trattini."
  validates :email, email: true

  def getCitta
    self.citta
  end

  # restituisce ids delle imprese appartenenti al polo
  def get_imprese
    imprese_ids= []
    self.citta.each do |citta|
      imprese_ids << citta.imprese.ids
    end
    imprese_ids
  end

  # restituisce emails di tutti gli utenti appartenenti al polo
  def get_utenti_emails
    emails=[]

    Utente.all.each do |utente|
      u= utente.get_act_utente #salvo titola/cliente relativo a utente
      if (self.citta.ids.include?(u.citta_id))
        emails << u.email
      end
    end

    emails
  end

  def getAdmins
    self.admins
  end

  # Necessario per mostrare il nome dell'Entita in RailsAdmin
  def name
    self.nome
  end

  #Metodi richiamati nel footer per il formato dell'indirizzo

  # Resituisce via e numero civico
  def getIndirizzo
    via = self.indirizzo.split(',')
    via.first
  end

  # Resituisce CAP e Citta
  def getCitta
    via = self.indirizzo.split(',')
    via.last
  end
end
