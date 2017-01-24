class Polo < ActiveRecord::Base
  has_many :citta
  has_many :admins

  # Validations necessarie per la registrazione
  validates :nome, presence: true

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

end
