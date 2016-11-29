class QuantitaProdottiOrdine < ActiveRecord::Migration
  def change
    add_column :ordini_prodotti, :qta, :integer
  end
end
