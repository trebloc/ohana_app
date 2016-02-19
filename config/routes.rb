Rails.application.routes.draw do
  get 'welcome/index'
  root to: "welcome#index"  

  get "/users/new", to: "users#new", as: "new_user"
  post "/users", to: "users#create"
  get "/users/:id", to: "users#show", as: "user"
  
  get "/login", to: "sessions#new"    
end
