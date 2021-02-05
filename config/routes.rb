Rails.application.routes.draw do
  root 'welcome#index'

  resources :users, only: [:new, :create]
  resources :discover, only: [:index]
  
  
  get '/users/:id/dashboard', to: 'users/dashboard#index'
  post '/users/:id/dashboard', to: 'friendships#create', as: 'friends'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
end
