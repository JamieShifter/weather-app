class HomeController < ApplicationController
  def index
    if params[:city].present?
      @weather = fetch_weather params[:city]
    else
      @weather = { description: "NOT WORKING", temperature: "SOMETHING IS" }
    end
  end
end
