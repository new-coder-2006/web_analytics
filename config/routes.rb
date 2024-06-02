Rails.application.routes.draw do
  get 'dashboard/index'
  get 'users/show'
  devise_for :users, controllers: {
    registrations: "users/registrations"
  }
  
  get 'sites/index'
  get 'home/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
  post "track", to: "trackers#create"

  # Defines the root path route ("/")
  root "home#index"
  get "sites", to: "sites#index"
  #get "users/sign_out", to: "home#index"

  resource :user, only: [:show]

  authenticated :user do
    root "dashboard#index", as: :authenticated_root
  end
end
