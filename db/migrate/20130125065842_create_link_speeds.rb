class CreateLinkSpeeds < ActiveRecord::Migration
  def change
    create_table :link_speeds do |t|
      t.integer :link_id
      t.float :speed
      t.integer :avg_travel_time
      t.datetime :date_time
      t.timestamps
    end
  end
end
