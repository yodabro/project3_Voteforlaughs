class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :email
      t.string :password_digest
      t.string :location
      t.string :phone_number
      t.integer :notify_radius
      t.integer :comedian_id
      t.integer :city_id

      t.timestamps null: false
    end
  end
end
