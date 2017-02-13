class AddDescrizioneIndirizzoToClienteTitolareImpresa < ActiveRecord::Migration
  def change
    add_column :imprese, :descrizione_indirizzo, :string
    add_column :titolari, :descrizione_indirizzo, :string
    add_column :clienti, :descrizione_indirizzo, :string
  end
end
