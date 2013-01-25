class LinkSpeed < ActiveRecord::Base
  belongs_to :link

  validates :avg_travel_time, :only_integer => true
end
