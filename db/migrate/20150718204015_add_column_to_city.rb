class AddColumnToCity < ActiveRecord::Migration
  def change
    add_column :cities, :vote_count, :integer
  end
end
