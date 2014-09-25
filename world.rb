require 'sinatra'
require 'timezone'
require 'geokit'



get '/' do 
	"What city? "
	erb:form
end

post '/form' do
   #res = Geokit::Geocoders::GoogleGeocoder.geocode('140 Market St, San Francisco, CA')
	#timezone = Timezone::Zone.new(:latlon => res.ll)
	#timezone.zone
	#=> "America/Los_Angeles" zone_end
	#timezone.time Time.now
	#=> 2011-12-01 14:02:13 UTC _end

	#timezones.each {|key,hash| total+=hash[:score]}
# 	for i in 1...timezones.length
# 	first_name = ""
# 	full_split=Name[i][0].split(" ")
# 	last_name = full_split[0]
# 	for index in 1...full_split.length
# 		first_name << full_split[index] + " "

# 	end
# 	cap_first_name = first_name[0].downcase + first_name[1..-3] + first_name[-2].upcase
# 	cap_last_name = last_name[0].downcase + last_name[1..-2] + last_name[-1].upcase
# 	puts cap_last_name +" " +cap_first_name
# end
	#display_time
	input_city=params[:message]
	if input_city.include? " "
		input_city.split(" ").map { |word| word.capitalize }.join(" ")
		input_city.gsub!(' ','_')
	end
	puts input_city

	display_zone=""

	timezones = Timezone::Zone.names
	print timezones
begin
	for i in 1...timezones.length
		if timezones[i].include? input_city
			display_zone=timezones[i]
		end
	end

	timezones.each do |s|
		if s.include? input_city
			display_zone=s
		end
	end

	zone= Timezone::Zone.new :zone => display_zone
	display_time=zone.time Time.now

	time_a=display_time.to_s.split[1]
	puts time_a
	puts display_time

  "The current time in #{input_city} is: #{time_a}"
rescue
	"Can't find the time of #{input_city}"
end
 

end