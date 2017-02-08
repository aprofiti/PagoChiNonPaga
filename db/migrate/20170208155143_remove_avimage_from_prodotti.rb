class RemoveAvimageFromProdotti < ActiveRecord::Migration
  def change
    remove_column :prodotti , :avimage
  end
end
