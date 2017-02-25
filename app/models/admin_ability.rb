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

class AdminAbility
  include CanCan::Ability

  def initialize(user)

    #condizione necessaria per mostrare le opzioni custom in rails_admin
    alias_action :show, :edit, :destroy, :history, :export, :to => :super_manage

    can :access, :rails_admin   # grant access to rails_admin
    can :dashboard              # grant access to the dashboard

    #TODO: da mettere eventualmente solo in superadmin
    can :import, Citta

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
      can :show, Ordine
      can :destroy, Ordine
      can :history, Ordine
      can :export, Ordine

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
