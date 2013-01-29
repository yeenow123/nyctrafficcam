class MapsController < ApplicationController
	def index
		#ids 160 (linkpoint id is 3170, delete 3169) lat should be 40.797
		#169 latitude should be: 40.80666
		all_points = []
		Link.includes(:link_points).all.each do |link|
			all_points << link.link_points.map { |pt| { lat: pt.latitude, lng: pt.longitude } }
		end				
					
		@data = all_points.to_json	
	
	end

end
