Rails.application.routes.draw do
  get 'post/index'
  get 'post/show'
  get 'users/index'
  get 'users/show'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
#  resources :users
  # Defines the root path route ("/")
  # root "articles#index"
  root "users#index"
  resources :users, only: [:index, :show] do
  resources :posts, only: [:index, :show] 
  end
end
