Rails.application.routes.draw do
  # Pagine Statiche
  #get 'static_pages/home_page'
  get '/registrati', to:'static_pages#registrati'
  get '/infoCarrello', to:'static_pages#carrello_mancante'
  #get '/login', to: 'devise/sessions#new', as: :login
  # Rotte per RailsAdmin
  mount RailsAdmin::Engine => '/cp', as: 'rails_admin'

  resources :poli, except: [:new,:edit], param: :nome
  devise_for :utenti, :path => '', :path_names => { :sign_in => "login", :sign_out => "logout"}
  devise_for :admins
  resources :citta, except: [:new,:edit] , param: :nome
  resources :ordini, except: :new, path: '/mieiOrdini'

  #PATH del tipo /imprese/:nome/prodotti/:nome
  resources :imprese, param: :nome do
    resources :prodotti, param: :nome
  end

  #PATH del tipo /categorie/:nome/sottocategorie/:nome
  resources :categorie, except: [:show,:new,:edit], param: :nome do  #Il parametro ora è il nome e non l'id
    resources :sottocategorie, except: [:new,:edit], param: :nome    #Il parametro ora è il nome e non l'id
  end

  resources :titolari, except: [:index]
  resources :clienti, except: [:index] do
    member do
      post :add_cart
    end
  end

  resources :carrello, except: [:index, :new]

  root 'static_pages#home_page'


#*********************ROTTE CANCELLATE************************
  #resources :indirizzi
  #resources :admins perchè si accede da rails_admin
  #resources :utenti
#*************************************************************

end
