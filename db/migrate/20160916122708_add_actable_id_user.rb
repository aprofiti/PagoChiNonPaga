class AddActableIdUser < ActiveRecord::Migration
  def change
    change_table :utenti do |t|
      t.integer :actable_id
      t.string  :actable_type
    end
  end
end
