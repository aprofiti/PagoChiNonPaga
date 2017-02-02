class Utente < ActiveRecord::Base
  # Entita' di partenza per l'IS-A
  actable
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

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

  def get_act_utente
    if(isTitolare?)
      Titolare.find(self.actable_id)
    else
      Cliente.find(self.actable_id)
    end
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

  def hasCarrello?
      isCliente? && Carrello.exists?(:cliente_id => self.actable_id)
  end

  def getCarrello
    Carrello.find_by! cliente_id: self.actable_id
  end

  # Ritorna il numero totale di Utenti presenti dentro l'intero DB VERIFICATI
  def num_utenti
    Utente.where("confirmed_at NOT NULL").count
  end

end
