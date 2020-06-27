# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'top#top'

  # 検索処理
  get '/teams/search', to: 'teams#search'
  # ゲストログイン
  post '/guest_sign_in', to: 'guest_users#new_guest'

  resources :administrators do
    get 'top', to: 'administrators#top'
  end

  devise_for :users,
             controllers: { registrations: 'registrations' }

  resources :users, only: %i[index show destroy]
  resources :challenge_starts, only: [:index]

  resources :teams do
    resources :feed_backs, only: %i[index show]
    collection do
      resources :belong_teams, only: %i[index show destroy]
    end

    resources :assigns, only: %i[create destroy update] do
      resources :tasks do
        resources :challenge_starts, only: %i[create update destroy] do
          resources :answers do
            resource :comments, only: %i[create edit update destroy]
            resource :feed_backs, only: %i[new create]
          end
        end
      end
      resources :belong_team_users, only: %i[index show]
    end
  end
  mount LetterOpenerWeb::Engine, at: '/letter_opener' if Rails.env.development?
end
