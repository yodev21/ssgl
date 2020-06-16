Rails.application.routes.draw do
  get 'administrators/new'
  get 'administrators/index'
  get 'administrators/show'
  get 'administrators/edit'
  root to: "teams#index"

  devise_for :users,
  controllers: { registrations: 'registrations' }

  resources :users, only: [:index, :show, :destroy]
  resources :challenge_starts, only: [:index]

  resources :teams do
    resources :feed_backs, only: [:index, :show]
    collection do
      resources :belong_teams, only: [:index, :show, :destroy]
    end

    resources :assigns, only: [:create, :destroy, :update] do
      resources :tasks do
        resources :challenge_starts, only: [:create, :destroy] do
          resources :answers do
            resource :comments, only: [:create, :edit, :update, :destroy]
            resource :feed_backs, only: [:create]
          end
        end
      end
      resources :belong_team_users, only: [:index, :show]
    end

  end
end
