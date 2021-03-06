class AppConfig < ActiveRecord::Base
  belongs_to :user

  validates :units, presence: true, inclusion: %w(internal metric imperial)
  validates :language, presence: true, format: /\A(([a-z]{2})|([a-z]{2}_[a-z]{2}))\z/
  validates :country, presence: true, format: /\A([A-Z]{2})\z/
  validates :name, presence: true
end
