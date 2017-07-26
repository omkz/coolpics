Rails.application.routes.draw do
  get 'notifications/index'

  resources :posts do
    resources :comments  
  end
  get 'search', to: 'search#search'

  resources :likes do
    member do
      put "like", to: "likes#like"
      put "unlike", to: "likes#unlike"
    end
  end

  # match :like, to: 'likes#like', as: :like, via: :post
  # match :unlike, to: 'likes#unlike', as: :unlike, via: :post

  get 'home/index'

  # devise_for :users
  # devise_scope :user do
  #   get '/users/auth/:provider' => 'users/omniauth_callbacks#passthru'
  # end
  devise_for :users, :controllers => { omniauth_callbacks: 'users/omniauth_callbacks', registrations: 'registrations' }

  resources  :users, :only => [:index, :show] do
    member do
      get :following, :followers
    end
  end

  resources :relationships,       only: [:create, :destroy]
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'home#index'
  mount ActionCable.server => '/cable'

  namespace :api do
    namespace :v1 do
      resources :home
    end
  end
end
