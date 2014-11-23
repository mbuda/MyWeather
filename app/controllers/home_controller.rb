class HomeController < ApplicationController
  def index
    @app_config = AppConfig.last
  end

  def weather
    @weather = Weather.new(params[:city])
  end
end
