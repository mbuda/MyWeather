require 'rails_helper'

describe Weather do
  let!(:metric) { create(:app_config) }
  let(:weather) { Weather.new('Gdynia') }

  it 'display wind speed with m/s symbol' do
    expect(weather.wind_speed[-3,3]).to eql('m/s')
  end

  context 'with metric units' do
    it 'display temperature with Celsius degree symbol' do
      expect(weather.temp[-2, 2]).to eql('°C')
    end
  end

  context 'with imperial units' do
    let!(:imperial) { create(:app_config_imp) }
    let(:weather2) { Weather.new('New York') }

    it 'display temperature with Fahrenheit degree symbol' do
      expect(weather2.temp[-2, 2]).to eql('°F')
    end
  end

  context 'with internal units' do
    let!(:internal) { create(:app_config_int) }
    let(:weather3) { Weather.new('London') }

    it 'display temperature with Kelvin degree symbol' do
      expect(weather3.temp[-1, 1]).to eql('K')
    end
  end
end

