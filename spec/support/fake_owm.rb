require 'sinatra/base'

class FakeOWM < Sinatra::Base
  get '/data/2.5/weather' do
    q = params['q']
    units = params['units']
    if q == 'Blah,pl'
      json_response 200, 'fake_city.json'
    else
      json_response 200, 'gdynia_metric.json'
    end
  end

  private
  def json_response(response_code, file_name)
    content_type :json
    status response_code
    File.open(File.dirname(__FILE__) + '/fixtures/' + file_name, 'rb').read
  end
end
