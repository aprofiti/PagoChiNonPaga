class StaticPagesController < ApplicationController
  def home_page
  end

  def registrati
  end

  # Pagina che mostra un messaggio informativo
  def carrello_mancante
    if utente_signed_in? && current_utente.isCliente?
      if current_utente.hasCarrello?
        # Mostro il carrello dell'utente
        redirect_to carrello_path(id: current_utente.getCarrello)
      else
        # Mostro un messaggio informativo
        flash[:notice] = "Aggiungi dei prodotti per visualizzare il carrello"
      end
    else
      # Non ho effettuato l'accesso mostro messaggio
      flash[:notice] = "Iscriviti oppure effettua l'accesso per utilizzare il carrello"
    end
  end

end
