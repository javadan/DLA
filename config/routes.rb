DirtyLoveAffairs::Application.routes.draw do
  root to: redirect('/dashboard')

  # authentication
  get 'login', to: 'sessions#new', as: :login
  get 'logout', to: 'sessions#destroy', as: :logout
  match 'auth/facebook/callback', to: 'sessions#create', via: %w(get post)
  match 'auth/failure', to: redirect('/'), via: %w(get post)

  # app
  get 'dashboard', to: 'dashboards#show', as: :dashboard
  resources :users, only: :index
  namespace :admin do
    resources :teams
  end
  resource :profile, only: %w(edit update)
  resources :enrolments, only: %w(index create show update destroy)

  get :help, to: 'help#index'
end
