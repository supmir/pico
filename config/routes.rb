Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root "shortenedlinks#new"

  # get "/links", to: "links#index"
  # get "/links/:id", to: "links#show"

  resources :links
end
