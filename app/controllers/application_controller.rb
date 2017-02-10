class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :mailer_set_url_options


#Quando posso faccio redirect a pagina precedente
#Quando invece ho errore (ActionController::RedirectBackError) "No HTTP_REFERER was set ..."
#faccio redirect a root

  def redirect_back
    redirect_to :back
  rescue ActionController::RedirectBackError
    redirect_to root_path
  end

  def after_sign_in_path_for(resource)
    if current_admin
      rails_admin_path
    elsif (current_utente.isCliente? )
      cliente_path(current_utente.actable_id)
    elsif (current_utente.isTitolare? )
      if current_utente.sign_in_count == 1
        new_impresa_path
      else
      titolare_path(current_utente.actable_id)
      end
    end
  end


  def mailer_set_url_options
    ActionMailer::Base.default_url_options[:host] = request.host_with_port
  end
end
