class CreateCategoria < ActiveRecord::Migration
  def change
    create_table :categoria do |t|
      t.string :nome

      t.timestamps null: false
    end
  end
end
