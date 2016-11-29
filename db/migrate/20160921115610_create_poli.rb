class CreatePoli < ActiveRecord::Migration
  def change
    create_table :poli do |t|
      t.string :nome

      t.timestamps null: false
    end
  end
end
