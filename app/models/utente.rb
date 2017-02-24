class Utente < ActiveRecord::Base
  # Entita' di partenza per l'IS-A
  actable
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  #
  # Metodi della Classe
  #

  # Ritorna il numero totale di Utenti presenti dentro l'intero DB VERIFICATI
  def self.get_num_utenti
    Utente.where.not("confirmed_at" => nil).count
  end

  #
  # Metodi di Istanza
  #

  def check_CF(nome,cognome,sesso,data_nascita,citta_nascita,provincia_nascita)
    if (citta_nascita == '' || sesso == '' ||
      nome == '' || cognome == '' ||
      data_nascita == '' || provincia_nascita == '')
      # ERRORE: Parametri non corretti
      return
    end

    # Calcolo il CF
    # Atteznione: La gemma puo' lanciare eccezioni per parametri non corretti
    begin
      # Controllo che la citta di nascita si corretta
      # Uso un metodo della gemma che restituisce il codice per la citta
      # In questo modo posso controllare che la citta esiste veramente
      CodiceFiscale::Codes.city(citta_nascita,provincia_nascita)

      # Fornisco i dati nel formato accettato dalla gemma
      valoriSesso = {'M' => :male, 'F' => :female}
      nome_nuovo = '' + nome
      cognome_nuovo = '' + cognome

      # Utilizzo la Gemma per calcolare il CF
      codice = CodiceFiscale.calculate(
        :name          => nome_nuovo,
        :surname       => cognome_nuovo,
        :gender        => valoriSesso[sesso],
        :birthdate     => data_nascita,
        :province_code => provincia_nascita,
        :city_name     => citta_nascita
      )
      # Debug del CF
      puts(codice)
      return codice
    rescue
      # ERRORE: In calcolo del codice fiscale ha lanciato una eccezione a causa dei parametri errati
      return false
    end
  end

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

end
