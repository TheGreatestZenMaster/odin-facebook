Rails.application.routes.draw do
  devise_for :users
  
  root to: "static_pages#home"
  get    '/help',    to: 'static_pages#help'
  get    '/about',   to: 'static_pages#about'
  get    '/contact', to: 'static_pages#contact'
  get    '/profile', to: 'static_pages#home'
  get    '/under_construction', to: 'static_pages#under_construction'
  
  resources :users, only: [:show, :new, :create, :edit, :show, :index] do
    resources :posts
    member do
      get :liked_posts
    end
  end
  resources :posts do
    resources :comments
    member do
      get :liked_by_user
    end
  end

  resources :likes,  only: [:create, :destroy]
  
  
end
