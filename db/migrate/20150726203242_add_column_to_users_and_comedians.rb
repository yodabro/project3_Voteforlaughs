class AddColumnToUsersAndComedians < ActiveRecord::Migration
  def change
    add_column :comedians, :podcast_title, :string
    add_column :users, :podcast_title, :string
  end
end
