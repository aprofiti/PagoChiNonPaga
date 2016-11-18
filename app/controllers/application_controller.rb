class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

#Quando posso faccio redirect a pagina precedente
#Quando invece ho errore (ActionController::RedirectBackError) "No HTTP_REFERER was set ..."
#faccio redirect a root

  def redirect_back
    redirect_to :back
  rescue ActionController::RedirectBackError
    redirect_to root_path

  end
end
