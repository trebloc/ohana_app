class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
      t.integer :user_id
      t.integer :event_id
      t.string :item_name
      t.string :item_description
      t.string :item_image_url

      t.timestamps null: false
    end
  end
end
