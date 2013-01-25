class MapsController < ApplicationController
	def index
		@points = []

		@links = Link.all
		@links.each do |l|
			l.link_points
		end
		@json = @points.to_gmaps4rails
	end
end
