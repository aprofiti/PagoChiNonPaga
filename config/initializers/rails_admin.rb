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
  config.authorize_with :cancan, AdminAbility # model AdminAbility.rb

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

    exclude_fields :created_at, :updated_at
  end

  config.model 'Citta' do
    parent Polo
    navigation_icon 'fa fa-globe'

    exclude_fields :created_at, :updated_at
  end

  # Sezione Utenti
  config.model 'Utente' do
    navigation_label 'Utenti del Sistema'
    navigation_icon 'fa fa-users'
    weight +3

    exclude_fields :created_at, :updated_at
  end

  config.model 'Admin' do
    parent Utente
    navigation_icon 'fa fa-user-secret'

    exclude_fields :created_at, :updated_at
  end

  config.model 'Titolare' do
    parent Utente
    navigation_icon 'fa fa-user'
    #permette di cercare anche per citta nonostante sia una associazione
    configure :citta do
      searchable [{Citta => :nome}]
      queryable true
    end
    exclude_fields :created_at, :updated_at
  end

  config.model 'Cliente' do
    parent Utente
    navigation_icon 'fa fa-user'
    #permette di cercare anche per citta nonostante sia una associazione
    configure :citta do
      searchable [{Citta => :nome}]
      queryable true
    end
    exclude_fields :created_at, :updated_at
  end

  # Sezione Imprese
  config.model 'Impresa' do
    navigation_label 'Sezione Imprese'
    navigation_icon 'fa fa-industry'
    weight +1

    #permette di cercare anche per città nonostante sia una associazione
    configure :citta do
      searchable [{Citta => :nome}]
      queryable true
    end
    #permette di cercare anche per titolare nonostante sia una associazione
    configure :titolare do
      searchable [{Titolare => :nome}]
      queryable true
    end
    #permette di cercare anche per sottocategorie nonostante sia una associazione
    configure :sottocategorie do
      searchable [{Sottocategoria => :nome}]
      queryable true
    end


    edit do
      field :nome
      field :descrizione, :froala
=begin
      Nascondo la relazione verso titolare
      Perchè non potrei assegnare nell'edit un titolare non appartenente al polo
      che sta facendo la modifica
=end
      configure :titolare do
        hide
      end
      include_all_fields  # Mostro i campi restanti
    end

    exclude_fields :created_at, :updated_at
  end

  config.model 'Prodotto' do
    parent Impresa
    navigation_icon 'fa fa-shopping-bag'

    #permette di cercare anche per imprese nonostante sia una associazione
    configure :impresa do
      searchable [{Impresa => :nome}]
      queryable true
    end
    edit do
      field :nome
      field :prezzo
      field :qta
      field :descrizione, :froala
      # Mostro i campi restanti
      include_all_fields
    end

    exclude_fields :created_at, :updated_at
  end

  config.model 'Categoria' do
    parent Impresa
    navigation_icon 'fa fa-list'
    weight +1
    #permette di cercare anche per sottocategorie nonostante sia una associazione
    configure :sottocategorie do
      searchable [{Sottocategoria => :nome}]
      queryable true
    end
    exclude_fields :created_at, :updated_at
  end

  config.model 'Sottocategoria' do
    parent Impresa
    navigation_icon 'fa fa-list'
    weight +2
    #permette di cercare anche per categoria nonostante sia una associazione
    configure :categoria do
      searchable [{Categoria => :nome}]
      queryable true
    end
    exclude_fields :created_at, :updated_at
  end

  # Sezione Ecommerce
  config.model 'Ordine' do
    navigation_label 'Sezione Ecommerce'
    navigation_icon 'fa fa-euro'
    weight +2

    #permette di cercare anche per imprese nonostante sia una associazione
    configure :impresa do
      searchable [{Impresa => :nome}]
      queryable true
    end
    #permette di cercare anche per stato nonostante sia una associazione
    configure :stato_ordine do
      searchable [{StatoOrdine => :stato_ordine}]
      queryable true
    end
    #permette di cercare anche per cliente nonostante sia una associazione
    configure :cliente do
      searchable [{Cliente => :nome}]
      queryable true
    end
    edit do
      configure :cliente do
        hide
      end
    end
    exclude_fields :created_at, :updated_at
  end

  # Sezione Ecommerce
  config.model 'Carrello' do
    parent Ordine
    navigation_icon 'fa fa-shopping-cart'
    weight +1

    exclude_fields :created_at, :updated_at
  end

  config.model 'CarrelloProdotto' do
    parent Ordine
    navigation_icon 'fa fa-cart-arrow-down'
    weight +2

    exclude_fields :created_at, :updated_at
  end

  config.model 'StatoOrdine' do
    parent Ordine
    navigation_icon 'fa fa-truck'
    weight +3

    exclude_fields :created_at, :updated_at
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

    # Lista delle Azioni abilitate per tutte le Entita:
    export
    bulk_delete
    show
    edit
    delete

    # Lista delle Azioni disabilitate per tutte le Entita:
    #show_in_app

    ## With an audit adapter, you can add:
     history_index
     history_show
  end

end
