class CreateCategorie < ActiveRecord::Migration
  def change
    create_table :categorie do |t|
      t.string :nome

      t.timestamps null: false
    end
  end
end
