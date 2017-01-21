class AddTotaleToOrdini < ActiveRecord::Migration
  def change
    add_column :ordini, :totale, :float
    add_index :ordini, :totale
  end
end
