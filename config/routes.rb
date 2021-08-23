Rails.application.routes.draw do
  root 'tops#index'
  get 'tops/index'
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  get 'comments/create'
  devise_for :users, controllers: {   registrations: 'users/registrations',
                                      sessions: 'users/sessions' }
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
  end
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
