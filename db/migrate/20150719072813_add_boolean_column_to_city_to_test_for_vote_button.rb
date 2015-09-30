class AddBooleanColumnToCityToTestForVoteButton < ActiveRecord::Migration
  def change
    add_column :cities, :show, :boolean
  end
end
