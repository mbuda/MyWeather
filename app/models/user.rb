class User < ActiveRecord::Base
  has_secure_password

  has_one :app_config

  validates :nick, presence: true, uniqueness: true, length: { within: 3..30 }
  validates :password, presence: true, length: { within: 6..30 }
  validates :password_confirmation, presence: true
end
