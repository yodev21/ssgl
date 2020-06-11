Rails.application.routes.draw do
  root to: "teams#index"

  devise_for :users,
  controllers: { registrations: 'registrations' }

  resources :users, only: [:index, :show, :destroy]
  
  resources :teams do

    collection do
      resources :belong_teams, only: [:index, :show, :destroy]
    end

    resources :assigns, only: [:create, :destroy, :update] do
      resources :tasks
      resources :belong_team_users, only: [:index, :show]
    end
    
  end
end
