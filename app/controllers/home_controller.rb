class HomeController < ApplicationController
  def index
    if current_user && current_user.app_config != nil
      @app_config = current_user.app_config
    else
      @app_config = AppConfig.first
    end

    @new_config = AppConfig.new
  end

  def weather
    @weather = Weather.new(params[:city])
  end
end
