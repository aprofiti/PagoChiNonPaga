class CreateImprese < ActiveRecord::Migration
  def change
    create_table :imprese do |t|
      t.string :nome
      t.string :telefono
      t.string :fax
      t.string :giorni_orari
      t.string :email
      t.string :sitoweb
      t.string :facebook
      t.string :descrizione
      t.float :lat
      t.float :lng
      t.boolean :verificato
      t.boolean :congelato

      t.timestamps null: false
    end
  end
end
