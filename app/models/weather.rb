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

  def wind_direction
    deg = @ow['wind']['deg']

    case deg
    when 337.5..360, 0...22.5
      'N'
    when 22.5...67.5
      'NE'
    when 67.5...112.5
      'E'
    when 112.5...157.5
      'SE'
    when 157.5...202.5
      'S'
    when 202.5...247.5
      'SW'
    when 247.5...292.5
      'W'
    when 292.5...337.5
      'NW'
    else
      'error'
    end
  end

  private
  def conf
    AppConfig.last
  end

  def units
    conf.units
  end
end
