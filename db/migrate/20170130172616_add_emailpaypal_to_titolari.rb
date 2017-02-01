class AddEmailpaypalToTitolari < ActiveRecord::Migration
  def change
    add_column :titolari, :email_paypal, :string
  end
end
