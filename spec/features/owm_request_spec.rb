require 'rails_helper'
require 'open_weather'

feature 'External openweathermap.org request' do
  it 'get current weather for Gdynia' do
    uri = URI('http://api.openweathermap.org/data/2.5/weather?q=Gdynia,pl&units=metric')

    response = JSON.load(Net::HTTP.get(uri))

    expect(response['cod']).to eql('200')
  end

  it 'do not get weather for fake city' do
    uri = URI('http://api.openweathermap.org/data/2.5/weather?q=Blah,pl&units=metric')

    response = JSON.load(Net::HTTP.get(uri))

    expect(response['cod']).to eql('404')
  end
end
