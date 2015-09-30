class AddColumnToFollows < ActiveRecord::Migration
  def change
    add_column :follows, :torf, :boolean
  end
end
