class AddCittaSedeToPolo < ActiveRecord::Migration
  def change
    add_column :poli, :citta_sede, :string
  end
end
