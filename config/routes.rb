Rails.application.routes.draw do
  devise_for :users
  root to: 'users#show'
  resources :users, only: :show
  resources :posts, only: :index
  resources :meetings do
    resources :comments, only: [:create, :destroy, :edit]
  end
end
