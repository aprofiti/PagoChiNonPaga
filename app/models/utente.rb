class Utente < ActiveRecord::Base
  # Entita' di partenza per l'IS-A
  actable
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

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
    end
    # Ritorna il nome
    utente.nome
  end

end
