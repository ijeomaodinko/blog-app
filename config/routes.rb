Rails.application.routes.draw do
  devise_for :users
  get 'likes/likes'
  get 'comments/comments'
  get 'posts/index'
  get 'posts/show'
  get 'users/index'
  get 'users/show'
  get 'posts/new'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
#  resources :users
  # Defines the root path route ("/")
  # root "articles#index"
  root "users#index"
  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :new, :create, :show, :destroy] 
      resources :comments, only: [:new, :create, :destroy]
      resources :likes, only: [:create]
    end 
end
