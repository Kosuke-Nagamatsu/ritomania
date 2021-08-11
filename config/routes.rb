Rails.application.routes.draw do
  get 'comments/create'
  root 'posts#index'
  devise_for :users
  resources :users, only: [:show]
  resources :posts do
    collection do
      post :confirm
    end
    resources :favorites, only: [:create, :destroy]
    resources :comments
  end
  resources :favorites, only: [:index]
end
