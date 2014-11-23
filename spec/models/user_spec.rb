require 'rails_helper'

describe User do
  subject(:user) { build(:user) }

  it { should have_one(:app_config) }

  it { should validate_presence_of(:nick) }
  it { should validate_uniqueness_of(:nick) }
  it { should have_secure_password }

  it { should be_valid }
end
