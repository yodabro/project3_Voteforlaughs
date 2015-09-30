class MergingComediansIntoUsersWithRoles < ActiveRecord::Migration
  def change
    add_attachment :users, :image
    add_column :users, :bio, :text
    add_column :users, :facebook, :text
    add_column :users, :instagram, :text
    add_column :users, :youtube, :text
    add_column :users, :user_id, :integer
    add_column :users, :event_id, :integer
  end
end
