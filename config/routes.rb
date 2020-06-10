Rails.application.routes.draw do
  get 'tasks/index'
  get 'tasks/show'
  get 'tasks/new'
  get 'tasks/edit'
  devise_for :users,
  controllers: { registrations: 'registrations' }
  root to: "teams#index"
  resources :users, only: [:index, :show, :destroy]
  resources :teams do
    resources :assigns
  end
end
