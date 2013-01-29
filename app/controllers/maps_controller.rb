class MapsController < ApplicationController
	def index
		all_points = []
		Link.includes(:link_points).all.each do |link|
			all_points << link.link_points.map { |pt| { lat: pt.latitude, lng: pt.longitude } }
		end				
					
		@data = all_points.to_json	
	
	end

end
