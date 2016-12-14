class AddClienteIdToCarrello < ActiveRecord::Migration
  def change
    change_table :carrello do |t|
      t.integer :cliente_id
    end
  end
end
