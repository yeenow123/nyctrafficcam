require 'open-uri'
require 'csv'

class BatchImportJob
	include Delayed::ScheduledJob

	run_every 10.seconds

	def display_name
		"Batch Import Traffic Speed Data"
	end

	def perform		
		puts "Hello"
		# url = "http://207.251.86.229/nyc-links-cams/LinkSpeedQuery.txt"
		# conn = open(url)

		# columns = [:link_id, :speed, :avg_travel_time, :date_time]
		# values = []
		
		# CSV.parse(conn.read, :col_sep => "\t", :headers => true) do |field|
		# 	record = []

		# 	datetime = DateTime.strptime(field[4], "%m/%d/%Y %H:%M:%S").to_time

		# 	record.push(field[0].to_i)
		# 	record.push(field[1].to_f)
		# 	record.push(field[2].to_i)
		# 	record.push(datetime)	

		# 	values.push(record)
		# end

		# LinkSpeed.import columns, values
	end
end


