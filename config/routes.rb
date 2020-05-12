Rails.application.routes.draw do
  # Devise routes
  devise_for :users
  
  # Root route
  root 'events#index'

  # Set users_controller routes
  resources :users
  
  # Set events_contrller routes
  resources :events
end