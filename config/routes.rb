Rails.application.routes.draw do
  resources :comments do
    resources :coincidences
  end
  resources :people
  resources :comment_types
  resources :zones
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get "/help", to: "home#help", as: "help"
  # Defines the root path route ("/")
  root "comments#index"
end
