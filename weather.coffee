# Description:
#   Tells the weather
#
# Configuration:
#   HUBOT_WEATHER_API_URL - Optional openweathermap.org API endpoint to use
#
# Commands:
#   weather in <location> - Tells about the weather in given location
#
# Author:
#   Corner
process.env.HUBOT_WEATHER_API_URL ||=
  'http://openweathermap.org/data/2.5/weather?units=imperial&appid=[your appid]&q='
module.exports = (robot) ->
  robot.hear /weather in (\w+)/i, (msg) ->
    city = msg.match[1]
    url = process.env.HUBOT_WEATHER_API_URL + city
    msg.robot.http(url).get() (err, res, body) ->
      data = JSON.parse(body)
      weather = [ "#{Math.round(data.main.temp)} degrees" ]
      for w in data.weather
        weather.push w.description
      msg.send "It's #{weather.join(', ')} in #{data.name}, #{data.sys.country}"
