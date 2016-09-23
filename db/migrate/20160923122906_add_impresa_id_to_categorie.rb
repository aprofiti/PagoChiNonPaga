class AddImpresaIdToCategorie < ActiveRecord::Migration
  def change
    change_table :Categorie do |t|
      t.belongs_to :impresa, index: true
    end
  end
end
