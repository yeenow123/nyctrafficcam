desc "Pull real-timedata from CSV file at https://nycopendata.socrata.com/Transportation/Real-Time-Traffic-Speed-Data/xsat-x5sa"

require 'csv'
require 'open-uri'

task :populate_links => :environment do

	# id = 0  INT
	# speed = 1  FLOAT (MPH)
	# traveltime = 2  INT (SECONDS)
	# status = 3
	# timedata = 4  DATETIME
	# linkId = 5
	# linkPoints = 6  FLOAT (LAT/LONG)
	# EncodedPolyline = 7
	# EncodedPolylineLvls = 8
	# Owner = 9
	# Transcom_id = 10
	# Borough = 11
	# LinkName = 12

	def lat_long_array(line)
		line.gsub!(/\n/, "")
		line.gsub!(/\)\(/, " ")
		line.gsub!(/(\)|\()/, "")
		line.gsub!(/\,\s/, ",")

		arr = line.split(" ")	
	end

	def get_location_pts(arr)
		pts = []
		arr.each do |a|
			tmp = a.split(",")
			tmp.map! { |v| v.to_f }
			pts.push(tmp)		
		end
		
		return pts
	end

	def populate_link_info
		url = "http://207.251.86.229/nyc-links-cams/LinkSpeedQuery.txt"
		conn = open(url)

		columns = [:link_id, :owner, :borough, :link_name]
		values = []

		CSV.parse(conn.read, :col_sep => "\t", :headers => true) do |field|
			record = []

			record.push(field[0].to_i)
			record.push(field[9])
			record.push(field[11])
			record.push(field[12])

			values.push(record)
			
		end

		Link.import columns, values
	end

	def populate_link_geodata
		url = "http://207.251.86.229/nyc-links-cams/LinkSpeedQuery.txt"
		conn = open(url)

		columns = [:link_id, :latitude, :longitude]
		values = []

		CSV.parse(conn.read, :col_sep => "\t", :headers => true) do |field|
			arr = lat_long_array(field[6])
			pts = get_location_pts(arr)

			pts.each do |pt|
				record = []

				record.push(field[0].to_i)
				record.push(pt[0])
				record.push(pt[1])
				values.push(record)

			end			
			
		end

		LinkPoint.import columns, values
	end

	populate_link_info
	populate_link_geodata
	
end








