class Link < ActiveRecord::Base
  has_many :link_points
  has_many :link_speeds

  validates :link_id, :uniqueness => true, 

  validates :link_id, :owner, :borough, :link_name, :presence => true
end
