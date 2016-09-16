class CreateTitolari < ActiveRecord::Migration
  def change
    create_table :titolari do |t|
      t.string :piva

      t.timestamps null: false
    end
  end
end
