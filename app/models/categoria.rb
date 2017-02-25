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

class Categoria < ActiveRecord::Base
  has_many :sottocategorie

  # Validations necessarie per la registrazione
  validates :nome, presence: true
  validate :unique_entry #custom validation

  # Custom validation per controllare unicita tra piu campi senza case_sensitive
  def unique_entry
    matched_entry = Categoria.where(['LOWER(nome) = LOWER(?)', self.nome]).first #il '?' e' un parametro per SQL passato da self.campo
    errors.add(:base, 'Categoria già presente.') if matched_entry && (matched_entry.id != self.id) #se non sono io stesso allora c'e' un errore
  end

  def getNome
    self.nome
  end

  # Necessario per mostrare il nome dell'Entita in RailsAdmin
  def name
    self.getNome
  end

end
