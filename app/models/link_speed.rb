class LinkSpeed < ActiveRecord::Base
  belongs_to :link

  validates :avg_travel_time, :numericality => { :only_integer => true }

  scope :top_ten_speeds, :order => "speed DESC", :limit => 10
end
