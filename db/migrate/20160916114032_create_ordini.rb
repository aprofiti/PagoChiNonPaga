class CreateOrdini < ActiveRecord::Migration
  def change
    create_table :ordini do |t|
      t.datetime :data
      t.string :stato

      t.timestamps null: false
    end
  end
end
