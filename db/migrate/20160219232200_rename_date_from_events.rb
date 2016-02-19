class RenameDateFromEvents < ActiveRecord::Migration
  def change
    rename_column :events, :date, :DateTime
  end
end
