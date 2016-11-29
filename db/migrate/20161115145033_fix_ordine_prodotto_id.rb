class FixOrdineProdottoId < ActiveRecord::Migration

  def change

    remove_column :prodotti, :ordine_id

  end

end
