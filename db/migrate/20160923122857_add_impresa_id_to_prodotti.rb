class AddImpresaIdToProdotti < ActiveRecord::Migration
  def change
    change_table :Prodotti do |t|
      t.belongs_to :impresa, index: true
    end
  end
end
