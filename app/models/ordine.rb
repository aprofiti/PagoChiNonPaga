class Ordine < ActiveRecord::Base
  belongs_to :cliente
  belongs_to :impresa
  has_and_belongs_to_many :prodotti
  belongs_to :stato_ordine

  # Validations necessarie per la registrazione
  validates :cliente_id, :impresa_id, :stato_ordine_id, presence: true
  validate :has_prodotti #custom validation
  validates_numericality_of :totale, :greater_than_or_equal_to => 0, on: :create
  validates_numericality_of :spedizione, :greater_than_or_equal_to => 0, on: :update


#validate sul totale disabilitato altrimenti non crea l'ordine. TODO metodo per il calcolo del totale

  # Una relazione habtm ha bisogno di una custom validation
  def has_prodotti
    errors.add(:base, 'Un ordine deve contenere almeno un prodotto.') if self.prodotti.blank?
    #se non ci sono prodotti viene generato un errore
  end

  # Ritorna lo stato dell'ordine in forma di stringa
  def getStato
    stato_ordine.stato
  end

  def occorrenzeProdotto(prodotto)
    self.prodotti.where(id: prodotto).count
  end

  def setTotale
    ids = self.prodotti.ids.uniq
    totale = 0.0
    ids.each do |id_prodotto|
      prezzo = Prodotto.find(id_prodotto).prezzo
      totale += occorrenzeProdotto(id_prodotto)*prezzo
    end
    new_totale= self.totale + totale
    self.update_attribute('totale', new_totale)
  end

  def setSpedizione(sped)
    if(sped>=0)
      self.update_attribute('spedizione',sped)
      @conferma = StatoOrdine.find_by_stato(StatoOrdine.CONFERMA)
      self.update_attribute('stato_ordine_id',@conferma.id) #lo stato va in conferma, in attesa della decisione del cliente
    else
      errors.add(:spedizione, "La spedizione deve essere >= 0€")
    end
  end

  def getSpedizione
    self.spedizione
  end

  def getTotale
    self.totale + self.getSpedizione
  end

  # Necessario per mostrare il nome dell'Entita in RailsAdmin
  def name
    "#" + self.id.to_s + "Cliente: " + self.cliente_id.to_s
  end

end
