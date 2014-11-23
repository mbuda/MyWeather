Rails.application.routes.draw do
  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'
  get 'sessions/new'

  match '/weather', to: 'home#weather', via: [:get]

  resources :users, only: [:new, :create]
  resources :sessions, only: [:new, :create, :destroy]
  resources :app_configs, only: [:create]

  root 'home#index'
end
