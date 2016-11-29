class CreateProdotti < ActiveRecord::Migration
  def change
    create_table :prodotti do |t|
      t.string :nome
      t.float :prezzo
      t.integer :qta
      t.string :descrizione

      t.timestamps null: false
    end
  end
end
