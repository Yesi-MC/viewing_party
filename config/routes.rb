Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "welcome#index"

  get "/movies", to: "movies#index"
  get "/movies/search", to: "movies#search"
  get "/movies/:id", to: "movies#details" 
  
  resources :users, only: [:new, :create]
  get '/users/:id/dashboard', to: 'users/dashboard#index', as: :dashboard
  get '/users/:id/watch_party/new', to: 'watch_party#new', as: 'new_party'
  post '/users/:id/dashboard', to: 'friendships#create', as: 'friends'
  
  resources :discover, only: [:index]
  

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
end







