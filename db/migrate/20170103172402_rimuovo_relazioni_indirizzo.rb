class RimuovoRelazioniIndirizzo < ActiveRecord::Migration
  def change
    remove_column :clienti , :indirizzo_id
    remove_column :titolari , :indirizzo_id
  end
end
