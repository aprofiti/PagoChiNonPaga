class AddSpedizioneToOrdini < ActiveRecord::Migration
  def change
    add_column :ordini, :spedizione, :float
  end
end
