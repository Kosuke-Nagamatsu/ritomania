Rails.application.routes.draw do
  root 'posts#index'
  devise_for :users
  resources :users, only: [:show]
  resources :posts do
    collection do
      post :confirm
    end
    resources :favorites, only: [:create, :destroy]
  end
end
