class HomeController < ApplicationController

  def index
    @weather = CityWeather.call(params[:city])
  end
end
