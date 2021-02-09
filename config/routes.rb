Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "welcome#index"

  get "/movies", to: "movies#index"
  get "/movies/search", to: "movies#search"
  get "/movies/:id", to: "movies#details" 
  
  resources :users, only: [:new, :create]
  resources :discover, only: [:index]
  
  
  get '/users/:id/dashboard', to: 'users/dashboard#index', as: :dashboard
  post '/users/:id/dashboard', to: 'friendships#create', as: 'friends'
  
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
  
  
  get '/watch_parties/new', to: 'watch_parties#new' 
end





