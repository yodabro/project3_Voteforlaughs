class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :date
      t.string :time
      t.string :location
      t.string :venue
      t.string :lineup
      t.string :tickets_link
      t.integer :comedian_id

      t.timestamps null: false
    end
  end
end
