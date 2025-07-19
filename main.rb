require 'json'
require 'open-uri'
require_relative 'a72_feed'

district_id = 5647  # For District 16

a72_url = ENV.fetch('A72_URL')
data = URI.open(a72_url).read
json = JSON.parse(data)

meetings = json.select { |m| m['district_id'] == district_id 
               .map { |m| A72Feed.google_meeting_to_tsml(m) }

puts JSON.pretty_generate(meetings)
