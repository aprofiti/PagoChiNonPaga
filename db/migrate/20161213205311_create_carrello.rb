class CreateCarrello < ActiveRecord::Migration
  def change
    create_table :carrello do |t|

      t.timestamps null: false
    end
  end
end
