Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations' # Use the custom registrations controller
  }

  resources :apps, only: [:new, :create]

  root 'home#index'

  # Add a route for the login page
  devise_scope :user do
    get 'login', to: 'devise/sessions#new'
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Additional routes...

  # Defines the root path route ("/")
  # root "posts#index"
end
