class Link < ActiveRecord::Base
  has_many :link_points, :primary_key => 'link_id'
  has_many :link_speeds

  validates :link_id, :presence => true, :uniqueness => true
  validates :owner, :presence => true
  validates :borough, :presence => true
  validates :link_name, :presence => true

  accepts_nested_attributes_for :link_speeds

end
