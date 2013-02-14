class MapsController < ApplicationController
	def index

		@top_speeds = LinkSpeed.most_recent.top_ten
		#ids 160 (linkpoint id is 3170, delete 3169) lat should be 40.797
		#169 latitude should be: 40.80666
		all_points = []
		Link.includes(:link_points).all.each do |link|
			all_points << link.link_points.map { |pt| { lat: pt.latitude, lng: pt.longitude } }
		end				
					
		@data = all_points.to_json	

		respond_to do |format|
			format.html
			format.js
			format.json { render :json => Link.all }
		end

	end

	def show
		@links = Link.all
		respond_to do |format|
			format.json { render :json => @links.to_json } 
		end
	end


end
