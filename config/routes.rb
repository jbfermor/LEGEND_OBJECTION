Rails.application.routes.draw do
  resources :comments
  resources :people
  resources :comment_types
  resources :zones
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "home#index"
end
