Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  root "lists#index"
#   No route needed for movies it willl be the root
# - The bookmark is nested inside the list
# - The list and movies are two separate routes (not nested)
  resources :lists do
    # We need a nestsed resource as the bookmark and the list are not independent of eachother.
    resources :bookmarks, only: [:new, :create]
  end
  resources :bookmarks, only: [:destroy]
end
