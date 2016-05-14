Rails.application.routes.draw do
  
  root 'posts#index'
  
  resources :posts
  resources :categories
  resources :profiles

  devise_for :users
end
