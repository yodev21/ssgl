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
  resources :teams, only: %i[index show]
  resources :assigns, only: %i[create] 
  resources :belong_teams, only: %i[index show destroy]
  resources :belong_team_users, only: %i[index show]
  resources :courses, only: %i[index show]
  resources :challenge_courses, only: %i[index create show]
  resources :tasks, only: %i[index show]
  resources :challenge_starts, only: %i[index show create destroy] 
  resources :answers
  resources :feed_backs, only: %i[new create]
  resources :comments, only: %i[create edit update destroy]

  namespace :mentor do
    resources :users
    resources :teams
    resources :assigns, only: %i[update destroy]
    resources :courses
    resources :limited_release_courses, only: %i[index show create destroy]
    resources :tasks
    resources :challenge_tasks, only: %i[create]
    resources :answers, only: %i[index show]
    resources :feed_backs, only: %i[show index]
  end

  mount LetterOpenerWeb::Engine, at: '/letter_opener' if Rails.env.development?
end
