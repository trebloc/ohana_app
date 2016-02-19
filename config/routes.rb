Rails.application.routes.draw do
  get 'events/index'

  get 'events/edit'

  get 'events/show'

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
end
