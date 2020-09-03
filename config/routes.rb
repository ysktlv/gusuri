Rails.application.routes.draw do
  root to: "sessions#index"
  get "auth/:provider/callback", to: "sessions#create"
  get "logout", to: "sessions#destroy"
  resources :reflections do
    resources :tweets
  end
  resources :goals
end
