Rails.application.routes.draw do
  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  get 'logout', to: 'sessions#destroy', as: 'logout'

  resources :home, only: [ :show ]
  resources :friendships, only: [ :index, :show, :create, :new, :destroy ]
  resources :sessions, only: [ :create, :destroy ]

  root to: 'home#show'
end
