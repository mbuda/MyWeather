class AppConfigsController < ApplicationController

  def create
    @app_config = AppConfig.new(c_params)
    @app_config.user_id = current_user.id
    if @app_config.save
      redirect_to root_url, notice: 'New config saved'
    else
      redirect_to root_url, notice: 'Sth went wrong'
    end
  end

  private
  def c_params
    params.require(:app_config).permit(:name, :country, :language, :units)
  end
end
