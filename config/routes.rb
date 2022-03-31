Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root "links#index"
  get "/links", to: "links#index"
  get "/links/:id", to: "links#show"
end
