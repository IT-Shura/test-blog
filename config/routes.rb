Rails.application.routes.draw do
  
  root 'posts#index'
  
  resources :posts, :categories
  
  get 'profile' => 'profile#index', as: :user_profile
  get 'profile/edit', as: :user_profile_edit
  post 'profile/update'
  post 'profile/update_password'
  
  devise_for :users
end
