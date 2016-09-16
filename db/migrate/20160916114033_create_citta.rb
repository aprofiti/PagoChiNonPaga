class CreateCitta < ActiveRecord::Migration
  def change
    create_table :citta do |t|
      t.string :nome
      t.string :provincia
      t.string :regione

      t.timestamps null: false
    end
  end
end
