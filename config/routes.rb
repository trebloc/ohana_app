Rails.application.routes.draw do
  get 'welcome/index'
  root to: "welcome#index"  

  get "/users/new", to: "users#new", as: "new_user"
end
