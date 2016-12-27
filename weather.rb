require 'yahoo_weatherman'

def get_weather_info(location)
	client = Weatherman::Client.new
	weather = client.lookup_by_location(location)
end

# The getting of the forecast info and the parsing are currently one big monster function. They should probably be two different functions.

def get_forecast(weather)
	weather = get_weather_info(weather)
	number_of_days = weather.forecasts.length

	forecasts = []

# The temp is returned in celcius, which I don't use, so I swap it when defining the variable. 

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