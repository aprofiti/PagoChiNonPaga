class CreateSottocategoria < ActiveRecord::Migration
  def change
    create_table :sottocategoria do |t|
      t.string :nome

      t.timestamps null: false
    end
  end
end
