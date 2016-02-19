class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.string :description
      t.string :place
      t.date :date
      t.time :time
      t.integer :host_id

      t.timestamps null: false
    end
  end
end
