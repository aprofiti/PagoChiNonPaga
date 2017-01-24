class AdminAbility
  include CanCan::Ability

  def initialize(user)

    #condizione necessaria per mostrare le opzioni custom in rails_admin
    alias_action :show, :edit, :destroy, :history, :export, :to => :super_manage

    can :access, :rails_admin   # grant access to rails_admin
    can :dashboard              # grant access to the dashboard

    if (user.superadmin?)
      can :manage, :all
    else
      can :manage, Polo, :id => user.polo_id
      can :manage, Cliente, :citta_id => user.polo.citta.ids
      can :manage, Categoria
      can :manage, Sottocategoria

      can :read, Citta
      can :export, Citta

      can :manage, Impresa, :citta_id => user.polo.citta.ids

      can :manage, Ordine, :impresa_id => user.polo.get_imprese
      can :super_manage, Ordine

      can :manage, Prodotto, :impresa_id => user.polo.get_imprese
      can :super_manage, Prodotto

      can :manage, Titolare, :citta_id => user.polo.citta.ids

      can :manage, StatoOrdine

      can :manage, Utente, :email => user.polo.get_utenti_emails

      can :manage, Admin, :polo_id => user.polo_id
      can :read, Admin
    end
  end
end
