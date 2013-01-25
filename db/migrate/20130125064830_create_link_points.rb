class CreateLinkPoints < ActiveRecord::Migration
  def change
    create_table :link_points do |t|
      t.integer :link_id
      t.float :latitude
      t.float :longitude
      t.boolean :gmaps
    end
  end
end
