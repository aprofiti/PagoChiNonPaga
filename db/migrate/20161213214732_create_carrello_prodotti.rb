class CreateCarrelloProdotti < ActiveRecord::Migration
  def change
    create_table :carrello_prodotti do |t|
      t.shopping_cart_item_fields # Creates the cart items fields
      t.timestamps null: false
    end
  end
end
