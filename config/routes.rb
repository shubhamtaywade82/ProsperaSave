Rails.application.routes.draw do
  resources :users, only: %i[index show]
  resources :registrations,
    controller: 'users/registrations',
    only: %i[new create edit update]
  resources :sessions,
    controller: 'users/sessions',
    only: %i[new create]
  delete 'logout', to: 'users/sessions#destroy', as: 'logout'
  get "up" => "rails/health#show", as: :rails_health_check
  root "users#index"
end