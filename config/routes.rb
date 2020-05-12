Rails.application.routes.draw do
  # Root route
  root 'events#index'
  
  # Set events_contrller routes
  resources :events
end
