class AggiuntaEmailPolo < ActiveRecord::Migration
  def change
    add_column :poli, :email, :string
  end
end
