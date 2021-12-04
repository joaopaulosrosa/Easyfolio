Rails.application.routes.draw do
  get 'home/explore'
  devise_for :users, controllers: { registrations: 'users/registrations' }
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # get 'about', to: 'pages#about'
  get 'coin_explore', to: 'pages#explore'
  get 'dashboard', to: 'pages#dashboard'
  get 'coin', to: 'pages#coin'
  get 'watchlist', to: 'watchlists#show'


  resources :users do
    resources :wallets, only: [ :new, :create, :destroy ] do
      resources :assets, only: [ :create, :destroy ]
    end
  end

  get 'watchlist', to: 'watchlists#show'
  resources :watchlists, only: [:show] do
    resources :coin_bookmarks, only: [:new, :create, :destroy]
  end

end
