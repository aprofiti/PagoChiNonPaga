class AddIndirizzoCapTelefonoSitowebToPolo < ActiveRecord::Migration
  def change
    add_column :poli, :cap, :string
    add_column :poli, :telefono, :string
    add_column :poli, :indirizzo, :string
    add_column :poli, :sitoweb, :string
  end
end
