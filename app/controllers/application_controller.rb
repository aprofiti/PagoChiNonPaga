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

class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :mailer_set_url_options


  # Quando posso faccio redirect a pagina precedente
  # Quando invece ho errore (ActionController::RedirectBackError) "No HTTP_REFERER was set ..."
  # faccio redirect a root
  def redirect_back
    redirect_to :back
  rescue ActionController::RedirectBackError
    redirect_to root_path
  end

  # Reindirizza dopo il login al Pannello di Controllo corrispondente alla tipologia dell'Utente
  def after_sign_in_path_for(resource)
    if current_utente
      # Controllo il tipo di Utente
      if (current_utente.isCliente?)

        # controllo se cliente ha ordini attivi e in caso lancio un flash
        idCliente = current_utente.actable_id
        cliente = Cliente.find(idCliente)
        ordini_attivi= cliente.getOrdiniAttivi
        if !ordini_attivi.empty?
          flash[:alert] = "Controlla lo stato degli ordini attivi."
        end

        # reindirizzo al cp di Cliente
        cliente_path(current_utente.actable_id)
      elsif (current_utente.isTitolare?)
        idTitolare = current_utente.actable_id
        titolare = Titolare.find(idTitolare)
        # Se il titolare non ha imprese registrate, viene reindirizzato alla creazione di una Impresa
        if titolare.getNumImprese == 0
          new_impresa_path
        else
          # Controllo se il titolare ha ordini attivi e in caso lancio un flash

          imprese = titolare.imprese
          # Itero nelle varie imprese
          imprese.each do |impresa|
            ordini = impresa.getOrdiniAttivi
            if !ordini.empty?
              # Ho degli ordini attivi in almeno una impresa
              flash[:alert] = "Controlla lo stato degli ordini attivi"
              return titolare_path(idTitolare)
            end
          end

          # reindirizzo il titolare nel suo cp
          titolare_path(idTitolare)
        end
      end
    elsif current_admin
        # Reindirizzo al Pannello di Controllo degli Admin
        rails_admin_path
    end
  end


  def mailer_set_url_options
    ActionMailer::Base.default_url_options[:host] = request.host_with_port
  end
end
