Rails.application.routes.draw do
  root "welcome#index"

  get "/movies", to: "movies#index", as: :movies
  get "/movies/search", to: "movies#search", as: :movies_search
  get "/movies/:id", to: "movies#details", as: :movies_details

  resources :users, only: [:new, :create]
  get '/users/:id/dashboard', to: 'users/dashboard#index', as: :dashboard
  get '/users/:id/watch_party/new', to: 'watch_parties#new', as: :new_watch_party
  post '/users/:id/dashboard', to: 'friendships#create', as: :friends

  resources :watch_parties, only: [:create]

  resources :discover, only: [:index]


  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

end
