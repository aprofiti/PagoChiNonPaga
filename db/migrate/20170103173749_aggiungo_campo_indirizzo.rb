class AggiungoCampoIndirizzo < ActiveRecord::Migration
  def change
    change_table :imprese do |t|
      t.string :indirizzo
    end
    rename_column :imprese, :lat , :latitude
    rename_column :imprese, :lng , :longitude
  end
end
