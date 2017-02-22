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
      # Reindirizzo al Profilo Utente
      if (current_utente.isCliente?)
        cliente_path(current_utente.actable_id)
      elsif (current_utente.isTitolare?)
        idTitolare = current_utente.actable_id
        titolare = Titolare.find(idTitolare)
        # Se il titolare non ha imprese registrate, viene reindirizzato alla creazione di una Impresa
        if titolare.getNumImprese == 0
          new_impresa_path
        else
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
