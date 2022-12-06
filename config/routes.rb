Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root "home#index"

  get "/index", to: "home#index"

  # # Defines a route for the "submit" action in the HomeController
  # post "/submit", to: "home#submit"
end
