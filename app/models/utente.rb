class Utente < ActiveRecord::Base
  # Entita' di partenza per l'IS-A
  actable
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  #TODO: servono delle validations anche qui?


  # Ritorna il nome dell'Utente
  # Viene utilizzato nelle view
  def getNome
    id = self.actable_id
    tipo = self.actable_type

    # Ricerco l'utente nella classe di apparteneza (IS-A nel database)
    if tipo == "Cliente"
      utente = Cliente.find(id)
    elsif tipo == "Titolare"
      utente = Titolare.find(id)
    else
      # Fix New Utente su RailsAdmin
      return ""
    end
    # Ritorna il nome
    utente.nome
  end

  # Necessario per mostrare il nome dell'Entita in RailsAdmin
  def name
    getNome()
  end

  #
  # METODI PER LATO VIEW
  #
  def isTitolare?
   self.actable_type == "Titolare"
  end

  def isCliente?
   self.actable_type == "Cliente"
  end

  def isMyImpresa?(impresa)
    if isTitolare? && self.actable_id == impresa.titolare_id
      true
    else
      false
    end
  end

end
