class AddRoleToComedians < ActiveRecord::Migration
  def change
    add_column :comedians, :role, :integer
  end
end
