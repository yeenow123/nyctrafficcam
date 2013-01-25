class LinkPoint < ActiveRecord::Base
  belongs_to :link

  validates_uniqueness_of :latitude, :scope => :longitude
end
