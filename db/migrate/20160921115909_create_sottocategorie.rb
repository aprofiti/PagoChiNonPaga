class CreateSottocategorie < ActiveRecord::Migration
  def change
    create_table :sottocategorie do |t|
      t.string :nome

      t.timestamps null: false
    end
  end
end
