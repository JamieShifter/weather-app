class HomeController < ApplicationController
  def index
    if params[:city].present?
      @weather = fetch_weather params[:city]
    else
      @weather = { description: "NOT WORKING", temperature: "SOMETHING IS" }
    end
  end

  private

  def fetch_weather(city)
    require "http"
    require "json"

    key = "583911f492d58ad6277957548f4831fe"
    url = "https://api.openweathermap.org/data/2.5/weather?q=#{city}&units=metric&appid=#{key}"
    response = JSON.parse(HTTP.get(url))
    weather = { 
      description: response["weather"][0]["main"], 
      temperature: response["main"]["temp"], 
      icon_url: "http://openweathermap.org/img/wn/#{response["weather"][0]["icon"]}@2x.png" }
  end
end
