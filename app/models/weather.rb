require 'open_weather'

class Weather
  def initialize(city)
    @ow = OpenWeather::Current.city(city + ', ' + conf.country,
                                    units: conf.units,
                                    lang: conf.language)
  end

  def temp
    @ow['main']['temp']
  end

  private
  def conf
    AppConfig.last
  end
end
