Rails.application.routes.draw do
<<<<<<< HEAD
  root "static_pages#home"
  get "home" => 'static_pages#home'
  get "help" => 'static_pages#help'
  get "about" => "static_pages#about"
  get "contact" => "static_pages#contact"
=======
  resources :tweets
  resources :users
>>>>>>> 003a6a86eaa0dc910f09d3cb95fdc47fc4f02fc1
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
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
