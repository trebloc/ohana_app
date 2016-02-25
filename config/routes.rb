Rails.application.routes.draw do
  #Splash   
  get 'welcome/index'
  root to: "welcome#index"  

  #Users
  get "/users/signup", to: "users#new", as: "new_user"
  post "/users", to: "users#create"
  get "/users/:id", to: "users#show", as: "user"
  get "/users/:id/edit", to: "users#edit", as: "edit_user"
  patch "/users/:id", to: "users#update"
  delete "/users/:id", to: "users#destroy"  

  #Sessions
  get "/login", to: "sessions#new", as: "login"
  get "/logout", to: "sessions#destroy" 
  post "/sessions", to: "sessions#create"  

  #Events
  get 'events', to: "events#index", as: "events"
  get 'events/new', to: "events#new", as: "new_event"  
  post '/events', to:'events#create' 
  get '/events/:id', to: 'events#show', as: "event"   
  get '/events/:id/edit', to: 'events#edit', as: "edit_event"
  patch '/events/:id', to: 'events#update'
  delete '/events/:id', to: "events#destroy"

  #Events
  # get 'event/:id/, to: "reservations#new" 
  post '/events/:id/reservations', to:'reservations#create', as: "reservations" 
  get '/events/:event_id/reservations/:id/edit', to: 'reservations#edit', as: "edit_reservation"
  patch '/events/:event_id/reservations/:id', to: 'reservations#update'
  delete '/events/:event_id/reservations/:id', to: "reservations#destroy", as: "delete_reservation"  

  #Photos
  get 'photos/index', to: "photos#index", as: "photos"
end
