class CityWeather < ApplicationService
  attr_reader :city

  def initialize(city)
    @city = city
  end

  def call
    if initial_state?
      weather = { state: "initial" }
    else
      weather = fetch_weather
    end
  end

  private

  def fetch_weather
    require "http"
    require "json"

    key = ENV["OPEN_WEATHER_MAP_API_KEY"]
    url = "https://api.openweathermap.org/data/2.5/weather?q=#{@city}&units=metric&appid=#{key}"
    
    response = JSON.parse(HTTP.get(url))
    if response["cod"] == 200
      weather = { 
        state: "success",
        description: response["weather"][0]["main"], 
        temperature: response["main"]["temp"], 
        icon_url: "http://openweathermap.org/img/wn/#{response["weather"][0]["icon"]}@2x.png" }
    else
      weather = { state: "error" }
    end
  end

  def initial_state?
    @city.nil?
  end
end
