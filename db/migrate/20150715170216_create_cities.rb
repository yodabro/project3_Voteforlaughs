class CreateCities < ActiveRecord::Migration
  def change
    create_table :cities do |t|
      t.string :city
      t.integer :votes
      t.integer :user_id
      t.integer :comedian_id

      t.timestamps null: false
    end
  end
end
