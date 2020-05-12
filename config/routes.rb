Rails.application.routes.draw do
  get 'users/new'
  # Root route
  root 'events#index'
  
  # Set users_contrller routes
  resources :users

  # Set events_contrller routes
  resources :events
end
