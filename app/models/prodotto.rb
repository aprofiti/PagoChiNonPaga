class Prodotto < ActiveRecord::Base
  belongs_to :impresa
  has_and_belongs_to_many :ordini

  # Validations necessarie per la registrazione
  validates :nome, :prezzo, :qta, :descrizione, :impresa_id, presence: true
  #TODO: servono controlli sui duplicati?

  # Necessario per mostrare il nome dell'Entita in RailsAdmin
  def name
    self.nome
  end

  def checkDisponibilita(qta,prod,carrello)

    prodotto_carrello = carrello.cart_items.where(item_id: 1).first
    if prodotto_carrello == nil
      qta_carrello = 0
    else
      qta_carrello = prodotto_carrello.quantity
    end
    self.qta > (qta + qta_carrello) && qta > 0
  end

  def getQuantita
    self.qta
  end

  def setQuantita(qta)
    nuova_qta = self.qta - qta
    self.update_attribute('qta', nuova_qta)
  end
end
