class RemoveCapFromPolo < ActiveRecord::Migration
  def change
    remove_column :poli, :cap, :string
  end
end
