class CreateUtenti < ActiveRecord::Migration
  def change
    create_table :utenti do |t|
      t.string :nome
      t.string :cognome
      t.string :cf
      t.date :data_nascita
      t.string :telefono

      t.timestamps null: false
    end
  end
end
