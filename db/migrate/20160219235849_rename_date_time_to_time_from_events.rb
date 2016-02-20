class RenameDateTimeToTimeFromEvents < ActiveRecord::Migration
  def change
    rename_column :events, :date, :datetime 
  end
end
