class AddImageToProdotti < ActiveRecord::Migration
  def change
    add_column :prodotti, :image, :string
  end
end
