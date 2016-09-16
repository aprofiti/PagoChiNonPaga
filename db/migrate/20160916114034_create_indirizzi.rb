class CreateIndirizzi < ActiveRecord::Migration
  def change
    create_table :indirizzi do |t|
      t.string :via
      t.integer :ncivico
      t.string :cap
      t.string :quartiere

      t.timestamps null: false
    end
  end
end
