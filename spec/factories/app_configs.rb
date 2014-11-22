FactoryGirl.define do
  factory :app_config, class: AppConfig do
    name 'polski'
    units 'metric'
    language 'pl'
    country 'PL'
  end

  factory :app_config_imp, class: AppConfig do
    name 'american'
    units 'imperial'
    language 'en'
    country 'US'
  end

  factory :app_config_int, class: AppConfig do
    name 'internal'
    units 'internal'
    language 'en'
    country 'GB'
  end

  factory :invalid_app_config, class: AppConfig do
    name nil
    units nil
    language nil
    country nil
  end
end
