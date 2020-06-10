Rails.application.routes.draw do
  devise_for :users,
  controllers: { registrations: 'registrations' }
  root to: "teams#index"
  resources :users, only: [:index, :show, :destroy]
  resources :teams
  resources :assigns
end
