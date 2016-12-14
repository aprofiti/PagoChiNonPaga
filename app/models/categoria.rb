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

  # Necessario per mostrare il nome dell'Entita in RailsAdmin
  def name
    self.nome
  end
end
