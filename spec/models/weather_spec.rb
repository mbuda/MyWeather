require 'rails_helper'

describe Weather do
  before do
    Weather.any_instance.stub(:wind_speed).and_return('2m/s')
    Weather.any_instance.stub(:temp).and_return('2°C')
  end

  let!(:app_config) { create(:app_config) }
  let(:weather) do
    Weather.new('Gdynia')
  end

  it 'display wind speed with m/s symbol' do
    expect(weather.wind_speed[-3,3]).to eql('m/s')
  end

  context 'with metric units' do
    it 'display temperature with Celsius degree symbol' do
      expect(weather.temp[-2, 2]).to eql('°C')
    end
  end

  context 'with imperial units' do
    before do
      Weather.any_instance.stub(:temp).and_return('40°F')
    end

    it 'display temperature with Fahrenheit degree symbol' do
      expect(weather.temp[-2, 2]).to eql('°F')
    end
  end

  context 'with internal units' do
    before do
      Weather.any_instance.stub(:temp).and_return('260K')
    end

    it 'display temperature with Kelvin degree symbol' do
      expect(weather.temp[-1, 1]).to eql('K')
    end
  end
end

