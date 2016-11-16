class FixOrdineProdottoHasBelongsMany < ActiveRecord::Migration
  def change

    create_table :ordini_prodotti, id: false do |t|
      t.belongs_to :ordine, index: true
      t.belongs_to :prodotto, index: true
    end

  end
end
