Rails.application.routes.draw do
  get 'welcome/index'
  root to: "welcome#index"  

  get "/users/new", to: "users#new", as: "new_user"
  post "/users", to: "users#create"
  get "/users/:id", to: "users#show", as: "user"
  get "/users/:id/edit", to: "users#edit", as: "edit_user"
  patch "/users/:id", to: "users#update"
  delete "/users/:id", to: "users#destroy"  

  get "/login", to: "sessions#new"
  get "/logout", to: "sessions#destroy" # <-- strictly speaking this isn't RESTful (it should be a DELETE not GET), but it's super conveient to do it this way
  post "/sessions", to: "sessions#create"  

  get 'events', to: "events#index", as: "events"
  get 'events/new', to: "events#new", as: "new_event"  
  post '/events', to:'events#create' 
  get '/events/:id', to: 'events#show', as: "event"   
end
