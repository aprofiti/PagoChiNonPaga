class AddPrezzoToOrdiniprodotto < ActiveRecord::Migration
  def change
    add_column :ordini_prodotti, :prezzo, :float
    add_index :ordini_prodotti, :prezzo
  end
end
