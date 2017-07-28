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

    rescue_from ActiveRecord::RecordNotFound, with: :on_record_not_found
    rescue_from AbstractController::ActionNotFound, with: :on_record_not_found
    rescue_from ActionController::RoutingError, with: :on_routing_error
    rescue_from CanCan::AccessDenied, with: :on_access_denied

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



         def render_404
            if params[:format].present? && params[:format] != 'html'
              head status: 404
            else
              render 'static_pages/404', status: 404
            end
          end

          def on_access_denied
            render_404
          end

    def on_record_not_found
        render_404
      end

      def on_routing_error
        render_404
      end





end
