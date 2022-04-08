Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root "shortened_links#new"

  # get "/links", to: "links#index"
  get "/picos/:id", to: "shortened_links#show"
  get "/analytics/:id", to: "shortened_links#analytics"
  
  resources :links do
    resources :shortened_links
  end
  resources :shortened_links do
    resources :analytics
  end

  get "/:path", to: "shortened_links#redirect"
end
