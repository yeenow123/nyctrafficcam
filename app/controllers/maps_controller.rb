class MapsController < ApplicationController
	def index
		@points = LinkPoint.all
		@json = @points.to_gmaps4rails
	end
end
