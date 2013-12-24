DirtyLoveAffairs::Application.routes.draw do
  root to: 'application#index'

  match 'auth/:provider/callback', to: 'sessions#create', via: %w(get post)
  match 'auth/failure', to: redirect('/'), via: %w(get post)
  # match 'signout', to: 'sessions#destroy', as: 'signout'

end
