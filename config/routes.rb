Rails.application.routes.draw do
  resources :posts
  root 'categories#index'
  resources :categories
  devise_for :users
end
