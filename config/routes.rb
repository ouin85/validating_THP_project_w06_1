Rails.application.routes.draw do
  # Devise routes
  devise_for :users
  
  # Root route
  root 'events#index'
  
  # Set events_contrller routes
  resources :events
end