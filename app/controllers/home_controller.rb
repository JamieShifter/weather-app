class HomeController < ApplicationController

  def index
    if params[:city].present?
      @weather = CityWeather.call(params[:city])
    else
      @weather = { description: "NOT WORKING", temperature: "SOMETHING IS" }
    end
  end
  
end
