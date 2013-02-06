class LinkSpeed < ActiveRecord::Base
  belongs_to :link, :primary_key => 'link_id'

  validates :avg_travel_time, :numericality => { :only_integer => true }

  scope :most_recent, :order => "created_at DESC", :limit => 195
  scope :top_ten, :order => "speed DESC", :limit => 10
end
