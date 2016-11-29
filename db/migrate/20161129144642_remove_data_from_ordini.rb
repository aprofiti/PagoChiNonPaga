class RemoveDataFromOrdini < ActiveRecord::Migration
  def change
    remove_column :ordini, :data
  end
end
