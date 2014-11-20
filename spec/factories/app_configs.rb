FactoryGirl.define do
  factory :app_config, class: AppConfig do
    units 'metric'
    language 'pl'
    country 'PL'
  end

  factory :invalid_app_config, class: AppConfig do
    units nil
    language nil
    country nil
  end
end
