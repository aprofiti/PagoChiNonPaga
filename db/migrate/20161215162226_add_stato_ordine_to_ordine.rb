class AddStatoOrdineToOrdine < ActiveRecord::Migration
  def change

    remove_column :ordini, :stato

    change_table :ordini do |t|
      t.belongs_to :stato_ordine, index: true
    end

  end
end
