class Polo < ActiveRecord::Base
  has_many :citta
  has_many :admins

  # Validations necessarie per la registrazione
  validates :nome, :citta, presence: true
  # TODO: admin obbligatorio alla registrazione crea problemi

  def getCitta
    self.citta
  end

  def getImprese
    # Ritorna una collezione, trovare un modo per risolvere

    #listaCitta = self.getCitta
    #getImprese
  end

  def getAdmins
    self.admins
  end
  # Necessario per mostrare il nome dell'Entita in RailsAdmin
  def name
    self.nome
  end

end
