Rails.application.routes.draw do
  devise_for :users
  
  root to: "static_pages#home"

  get    '/help',    to: 'static_pages#help'
  get    '/about',   to: 'static_pages#about'
  get    '/contact', to: 'static_pages#contact'

  get    '/under_construction', to: 'static_pages#under_construction'
  post    'friendships/friendrequest', controller: 'friendships', action: :edit

  resources :users, only: [:show, :new, :create, :edit, :show, :index] do
    resources :posts
    resources :friendships, only: [:index]
    member do
      get :liked_posts
      get :profile
    end
  end
  resources :posts do
    resources :comments
    member do
      get :liked_by_user
    end
  end

  resources :likes,  only: [:create, :destroy]
  resources :friendships, only: [:create, :update, :destroy]
  resources :notifications
  

  
end
