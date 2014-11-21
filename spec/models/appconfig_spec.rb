require 'rails_helper'

describe AppConfig do
  subject(:app_config) { build(:app_config) }

  it { should validate_presence_of(:name) }

  it { should validate_presence_of(:units) }
  it do
    should validate_inclusion_of(:units).
      in_array(%w(internal metric imperial))
  end

  it { should validate_presence_of(:language) }
  it { should allow_value('jp', 'zh_cn').for(:language) }
  it { should_not allow_value('Jp').for(:language) }
  it { should_not allow_value('kldo').for(:language) }

  it { should validate_presence_of(:country) }
  it { should allow_value('JP', 'GB').for(:country) }
  it { should_not allow_value('Japan').for(:country) }
end
