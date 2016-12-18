class Sottocategoria < ActiveRecord::Base
  belongs_to :categoria
  has_and_belongs_to_many :imprese

  # Validations necessarie per la registrazione
  validates :nome, :categoria_id, presence: true
  validate :unique_entry #custom validation

  # Custom validation per controllare unicita tra piu campi senza case_sensitive
  def unique_entry
    matched_entry = Sottocategoria.where(['LOWER(nome) = LOWER(?) AND categoria_id=?', self.nome, self.categoria_id]).first #il '?' e' un parametro per SQL passato da self.campo
    errors.add(:base, 'Sottocategoria già presente.') if matched_entry && (matched_entry.id != self.id) #se non sono io stesso allora c'e' un errore
  end

  # Necessario per mostrare il nome dell'Entita in RailsAdmin
  def name
    self.nome
  end

end
