class AddEliminatoToProdotti < ActiveRecord::Migration
  def change
    add_column :prodotti, :eliminato, :boolean
  end
end
