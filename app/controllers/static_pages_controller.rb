=begin
Copyright 2017 Alessandro Profiti, Gabriele Restuccia, Lorenzo Ricelli.

This file is part of PagoChiNonPaga.

PagoChiNonPaga is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

PagoChiNonPaga is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.
=end

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
