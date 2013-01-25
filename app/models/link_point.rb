class LinkPoint < ActiveRecord::Base

  acts_as_gmappable :process_geocoding => false

  belongs_to :link, :foreign_key => 'link_id'

end
