Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }

  resources :movies do
    resources :comments
    resources :ratings
  end

  resources :moviedetails
  resources :movietrendings

  # Health check
  get "up" => "rails/health#show", as: :rails_health_check

  # Root route (optional)
  # root "movies#index"
end
