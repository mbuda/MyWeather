require 'open_weather'

class Weather
  def initialize(city)
    @ow = OpenWeather::Current.city(city + ', ' + conf.country,
                                    units: units,
                                    lang: conf.language)
  end

  def temp
    t = @ow['main']['temp'].to_s

    if units == 'metric'
      t + '°C'
    elsif units == 'imperial'
      t + '°F'
    else
      t + 'K'
    end
  end

  def wind_speed
    @ow['wind']['speed'].to_s + 'm/s'
  end

  private
  def conf
    AppConfig.last
  end

  def units
    conf.units
  end
end
