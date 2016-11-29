class CreateClienti < ActiveRecord::Migration
  def change
    create_table :clienti do |t|

      t.timestamps null: false
    end
  end
end
