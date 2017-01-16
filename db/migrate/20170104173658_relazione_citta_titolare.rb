class RelazioneCittaTitolare < ActiveRecord::Migration
  def change
    change_table :titolari do |t|
      t.belongs_to :citta, index: true
    end

    rename_column :clienti, :indirizzo_cliente , :indirizzo
    rename_column :titolari, :indirizzo_titolare , :indirizzo
  end
end
