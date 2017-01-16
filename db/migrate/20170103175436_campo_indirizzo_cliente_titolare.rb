class CampoIndirizzoClienteTitolare < ActiveRecord::Migration
  def change
    change_table :clienti do |t|
      t.string :indirizzo_cliente
    end

    change_table :titolari do |t|
      t.string :indirizzo_titolare
    end
  end
end
