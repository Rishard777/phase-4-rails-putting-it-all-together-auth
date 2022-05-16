Rails.application.routes.draw do
  resources :recipes, only: [:index, :create]
  resources :users, only: [:create, :show]

  post "/signup", to: "users#create"

  delete "/logout", to: "session#destroy"

  post "/login", to: "session#create"

  get "/me", to: "users#show"

  get "/recipes", to: "recipes#index"

  post "/recipes", to: "recipes#create"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
