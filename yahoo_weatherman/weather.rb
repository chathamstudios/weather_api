require 'yahoo_weatherman'

def get_weather_info(location)
	client = Weatherman::Client.new
	weather = client.lookup_by_location(location)
end

def get_forecast(weather)
	weather = get_weather_info(weather)
	number_of_days = weather.forecasts.length

	forecasts = []

	i = 0
	while i < number_of_days 
		day = weather.forecasts[i]['day']
		desc = weather.forecasts[i]['text']
		low = (weather.forecasts[i]['low'] * 9 / 5) + 32 
		high = (weather.forecasts[i]['high'] * 9 / 5) + 32
		if i == 0
			forecasts << "Today is going to be #{desc.downcase} with a low of #{low} and a high of #{high}."
		elsif i == 1
			forecasts << "Tomorrow is going to be #{desc.downcase} with a low of #{low} and a high of #{high}."
		else
			forecasts << "#{day.capitalize} is going to be #{desc.downcase} with a low of #{low} and a high of #{high}."
		end
		i += 1
	end
	puts forecasts
end

puts "What is your 5-digit zip code?"
zip = gets.to_s
get_weather_info(zip)
get_forecast(zip)