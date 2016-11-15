class CreateRelations < ActiveRecord::Migration
  def change

    change_table :admins do |t|
      t.belongs_to :polo, index: true
    end

    change_table :sottocategorie do |t|
      t.belongs_to :categoria, index: true
      t.belongs_to :impresa, index: true
    end

    change_table :citta do |t|
      t.belongs_to :polo, index: true
    end

    change_table :imprese do |t|
      t.belongs_to :citta, index: true
      t.belongs_to :titolare, index: true
      t.belongs_to :sottocategoria, index: true
    end

    change_table :indirizzi do |t|
      t.belongs_to :citta, index: true
    end

    change_table :ordini do |t|
      t.belongs_to :cliente, index: true
      t.belongs_to :impresa, index: true
    end

    change_table :clienti do |t|
      t.belongs_to :indirizzo, index: true
    end

    change_table :titolari do |t|
      t.belongs_to :indirizzo, index: true
    end

    change_table :prodotti do |t|
      t.belongs_to :impresa, index: true
      t.belongs_to :ordine, index: true
    end

    create_table :imprese_sottocategorie, id: false do |t|
      t.belongs_to :impresa, index: true
      t.belongs_to :sottocategoria, index: true
    end

  end
end
