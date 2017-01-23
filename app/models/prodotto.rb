class Prodotto < ActiveRecord::Base
  belongs_to :impresa
  has_and_belongs_to_many :ordini

  # Validations necessarie per la registrazione
  validates :nome, :prezzo, :qta, :descrizione, :impresa_id, presence: true
  validates_numericality_of :qta, :greater_than_or_equal_to => 0, on: :create
  validates_numericality_of :prezzo, :greater_than_or_equal_to => 0, on: :create, only_float: true
  validate :unique_entry #custom validation

  # Custom validation per controllare unicita tra piu campi senza case_sensitive
  def unique_entry
    matched_entry = Prodotto.where(['LOWER(nome) = LOWER(?) AND impresa_id=?', self.nome, self.impresa_id]).first #il '?' e' un parametro per SQL passato da self.campo
    errors.add(:base, 'Prodotto già presente.') if matched_entry && (matched_entry.id != self.id) #se non sono io stesso allora c'e' un errore
  end

  # Necessario per mostrare il nome dell'Entita in RailsAdmin
  def name
    self.nome
  end

  def checkDisponibilita(qta,carrello)
    prodotto_carrello = carrello.cart_items.where(item_id: self.id).first
    qta_carrello=0
    if prodotto_carrello != nil
      qta_carrello = prodotto_carrello.quantity
    end
    self.qta >= (qta + qta_carrello) && qta > 0
  end

  def  checkDisponibilitaOrdine(qta_carrello)
     self.qta >= qta_carrello
  end

  def getQuantita
    self.qta
  end

  def setQuantita(qta)
    nuova_qta = self.qta - qta
    self.update_attribute('qta', nuova_qta)
  end
end
