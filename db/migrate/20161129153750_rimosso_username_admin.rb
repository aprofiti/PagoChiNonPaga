class RimossoUsernameAdmin < ActiveRecord::Migration
  def change
    remove_column :admins, :username
  end
end
