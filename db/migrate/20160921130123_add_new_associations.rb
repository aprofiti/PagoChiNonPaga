class AddNewAssociations < ActiveRecord::Migration
  def change

    change_table :admins do |t|
      t.belongs_to :polo, index: true
    end

    # NON NECESSARIO
    #change_table :categorie do |t|
    #end

    change_table :citta do |t|
      t.belongs_to :polo, index: true
    end

    change_table :clienti do |t|
      t.belongs_to :citta, index: true
    end

    change_table :imprese do |t|
      t.belongs_to :titolare, index: true
      t.belongs_to :citta, index: true
    end

    change_table :indirizzi do |t|
      t.belongs_to :citta, index: true
    end

    change_table :ordini do |t|
      t.belongs_to :cliente, index: true
      t.belongs_to :impresa, index: true
    end

    change_table :poli do |t|
      t.belongs_to :admin, index: true
    end

    # NON NECESSARIO
    #change_table :prodotti do |t|
    #end

    change_table :sottocategorie do |t|
      t.belongs_to :categoria, index: true
    end

    change_table :titolari do |t|
      t.belongs_to :citta, index: true
    end

  end
end
