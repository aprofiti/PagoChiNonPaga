class AddImageToImprese < ActiveRecord::Migration
  def change
    add_column :imprese, :image, :string
  end
end
