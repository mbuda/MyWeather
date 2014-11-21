class HomeController < ApplicationController
  def index
  end

  def weather
    @weather = Weather.new(params[:city])
  end
end
