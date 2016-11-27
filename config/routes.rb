Rails.application.routes.draw do
  get 'static_pages/home_page'

  mount RailsAdmin::Engine => '/cp', as: 'rails_admin'


  resources :poli, except: [:new,:edit]
  devise_for :utenti
  devise_for :admins
  resources :citta, except: [:new,:edit]
  resources :ordini, except: :new

  #PATH del tipo /imprese/:nome/prodotti/:nome
  resources :imprese, param: :nome do
    resources :prodotti, param: :nome
  end

  #PATH del tipo /categorie/:nome/sottocategorie/:nome
  resources :categorie, except: [:show,:new,:edit], param: :nome do  #Il parametro ora è il nome e non l'id
    resources :sottocategorie, except: [:new,:edit], param: :nome    #Il parametro ora è il nome e non l'id
  end

  resources :titolari, except: [:index]
  resources :clienti, except: [:index]
  root 'static_pages#home_page'


#*********************ROTTE CANCELLATE************************
  #resources :indirizzi
  #resources :admins perchè si accede da rails_admin
  #resources :utenti
#*************************************************************

end
