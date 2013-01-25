class CreateLinks < ActiveRecord::Migration
  def change
    create_table :links do |t|
      t.integer :link_id
      t.string :owner
      t.string :borough
      t.string :link_name
    end
  end
end
