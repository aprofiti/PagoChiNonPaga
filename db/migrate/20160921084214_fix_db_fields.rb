class FixDbFields < ActiveRecord::Migration
  def change

    remove_column :utenti, :nome
    remove_column :utenti, :cognome
    remove_column :utenti, :cf
    remove_column :utenti, :data_nascita
    remove_column :utenti, :telefono
    change_table :clienti do |t|
      t.string   "nome"
      t.string   "cognome"
      t.string   "cf"
      t.date     "data_nascita"
      t.string   "telefono"
    end
    change_table :titolari do |t|
      t.string   "nome"
      t.string   "cognome"
      t.string   "cf"
      t.date     "data_nascita"
      t.string   "telefono"
    end

  end

end
