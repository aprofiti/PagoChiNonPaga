Rails.application.routes.draw do
  get 'static_pages/home_page'

  mount RailsAdmin::Engine => '/cp', as: 'rails_admin'

  resources :sottocategorie, except: [:new,:edit]
  resources :categorie, except: [:new,:edit]
  resources :poli, except: [:new,:edit]
  devise_for :utenti
  devise_for :admins
  #resources :indirizzi
  resources :citta, except: [:new,:edit]
  resources :ordini
  resources :prodotti
  resources :imprese
  #resources :admins perchè si accede da rails_admin
  resources :titolari, except: [:index]
  resources :clienti, except: [:index]  #CONTROLLER FATTO
  #resources :utenti
  root 'static_pages#home_page'
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase


end
