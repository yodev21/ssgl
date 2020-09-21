# frozen_string_literal: true

Rails.application.routes.draw do
  
  root to: 'top#top'
  get 'top/privacy_policy', to: "top#privacy_policy"
  get 'top/terms_of_service', to: "top#terms_of_service"

  # 検索処理
  get '/teams/search', to: 'teams#search'
  # ゲストログイン
  post '/guest_sign_in', to: 'guest_users#new_guest'

  resources :administrators do
    get 'top', to: 'administrators#top'
  end

  devise_for :users,
             controllers: { registrations: 'registrations' }

  resources :users, only: %i[index show destroy] do
    post '/change_status', to: 'users#change_status'
  end
  resources :teams
  resources :assigns, only: %i[create destroy update] 

  resources :belong_teams, only: %i[index show destroy]
  resources :belong_team_users, only: %i[index show]
  
  resources :courses
  resources :challenge_courses, only: %i[index create show]
  resources :tasks
  resources :challenge_starts, only: %i[index show create update destroy] 
  resources :answers
  resources :feed_backs, only: %i[new create index show]
  resources :comments, only: %i[create edit update destroy]

  mount LetterOpenerWeb::Engine, at: '/letter_opener' if Rails.env.development?
end
