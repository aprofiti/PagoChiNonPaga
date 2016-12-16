class CreateStatoOrdini < ActiveRecord::Migration
  def change
    create_table :stato_ordini do |t|
      t.string :stato

      t.timestamps null: false
    end
  end
end
