RailsAdmin.config do |config|
  # Titolo mostrato nel Pannello
  config.main_app_name = ['PagoChiNonPaga', '- Pannello di Amministrazione -']

  ### Popular gems integration
  ## == Devise ==
   config.authenticate_with do
     warden.authenticate! scope: :admin
   end
   config.current_user_method(&:current_admin)

  ## == Cancan ==
  # config.authorize_with :cancan

  ## == Pundit ==
  # config.authorize_with :pundit

  ## == PaperTrail ==
   config.audit_with :paper_trail, 'Admin', 'PaperTrail::Version' # PaperTrail >= 3.0.0
  ### More at https://github.com/sferik/rails_admin/wiki/Base-configuration

  #
  # Configurazione delle sezioni della Barra di Navigazione
  #

  # Sezione Amministratori
  config.model 'Polo' do
    navigation_label 'Sezione Amministratori'
    navigation_icon 'fa fa-map-marker'
    weight 0
  end

  config.model 'Citta' do
    parent Polo
    navigation_icon 'fa fa-globe'
  end

  # Sezione Utenti
  config.model 'Utente' do
    navigation_label 'Utenti del Sistema'
    navigation_icon 'fa fa-users'
    weight +3
  end

  config.model 'Admin' do
    parent Utente
    navigation_icon 'fa fa-user-secret'
  end

  config.model 'Titolare' do
    parent Utente
    navigation_icon 'fa fa-user'
  end

  config.model 'Cliente' do
    parent Utente
    navigation_icon 'fa fa-user'
  end

  # Sezione Imprese
  config.model 'Impresa' do
    navigation_label 'Sezione Imprese'
    navigation_icon 'fa fa-industry'
    weight +1
  end

  config.model 'Prodotto' do
    parent Impresa
    navigation_icon 'fa fa-shopping-bag'
  end

  config.model 'Categoria' do
    parent Impresa
    navigation_icon 'fa fa-list'
    weight +1
  end

  config.model 'Sottocategoria' do
    parent Impresa
    navigation_icon 'fa fa-list'
    weight +2
  end

  # Sezione Ecommerce
  config.model 'Carrello' do
    navigation_label 'Sezione Ecommerce'
    navigation_icon 'fa fa-shopping-cart'
    weight +2
  end

  config.model 'Ordine' do
    parent Carrello
    navigation_icon 'fa fa-euro'
  end

  config.model 'CarrelloProdotto' do
    parent Carrello
    navigation_icon 'fa fa-cart-arrow-down'
  end

  config.model 'StatoOrdine' do
    parent Carrello
    navigation_icon 'fa fa-truck'
  end


  # Configuro le azioni che si possono utilizzare nel pannello
  config.actions do
    dashboard                     # mandatory
    index                         # mandatory

    # Rimuove la possibilita' di creare un nuovo Cliente o Titolare via pannello
    # Incompatibilita' con la gemma 'active_record-acts_as'
    new do
      except [Cliente, Titolare]
    end

    export
    bulk_delete
    show
    edit
    delete
    show_in_app

    ## With an audit adapter, you can add:
     history_index
     history_show
  end

end
