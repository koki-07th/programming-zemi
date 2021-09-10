Rails.application.routes.draw do
  resources :tweets
  resources :users
  get "signup" => "users#new"
  get "login" => "sessions#new"
  post "login" => "sessions#create"
  delete "logout" => "sessions#destroy"
  post "follow/:id" => "relationships#follow", as: "follow"
  post "unfollow/:id" => "relationships#unfollow", as: "unfollow"
  resources :users do
    member do
      get :following, :followers
    end
  end
  resources :tweets, only: [:create, :edit, :update, :destroy]

end