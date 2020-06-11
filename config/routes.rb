Rails.application.routes.draw do
  devise_for :users,
  controllers: { registrations: 'registrations' }
  root to: "teams#index"
  resources :users, only: [:index, :show, :destroy]
  resources :teams do
    collection do
      resources :belong_teams, only: [:index, :show, :destroy]
    end
    resources :assigns do
      resources :tasks
    end
  end
end
