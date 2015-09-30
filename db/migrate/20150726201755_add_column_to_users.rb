class AddColumnToUsers < ActiveRecord::Migration
  def change
    add_column :users, :podcast, :string
  end
end
