class RelazioneCittaCliente < ActiveRecord::Migration
  def change
    change_table :clienti do |t|
      t.belongs_to :citta, index: true
    end
  end
end
