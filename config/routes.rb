Rails.application.routes.draw do
  get 'sessions/login'
  post 'sessions/create'
  get 'sessions/logout'
  resources :users
  root 'index#input'
  get 'index/output'
end
