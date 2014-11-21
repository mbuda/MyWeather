Rails.application.routes.draw do
  match '/weather', to: 'home#weather', via: [:get]

  root 'home#index'
end
