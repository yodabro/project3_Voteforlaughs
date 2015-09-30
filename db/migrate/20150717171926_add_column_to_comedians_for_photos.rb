class AddColumnToComediansForPhotos < ActiveRecord::Migration
  def change
    add_attachment :comedians, :image
  end
end
