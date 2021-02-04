Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "welcome#index"

  get "/movies", to: "movies#index"
  get "/movies/search", to: "movies#search"
  get "/movies/:id", to: "movies#details" 
  
  get "/discover", to: "discover#index"
end







