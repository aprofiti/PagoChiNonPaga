class FixIdImpresaSottocategoria < ActiveRecord::Migration

  def change

    remove_column :imprese, :sottocategoria_id
    remove_column :sottocategorie, :impresa_id

  end

end
