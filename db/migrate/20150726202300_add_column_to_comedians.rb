class AddColumnToComedians < ActiveRecord::Migration
  def change
    add_column :comedians, :podcast, :string
  end
end
