Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'about', to: 'pages#about'
  get 'contact', to: 'pages#contact'
  
  resources :users do
    resources :wallets, only: [ :new, :create, :destroy, :show, :index ]
  end
  
  get 'watchlist', to: 'watchlists#show'
  
  resources :watchlists, only: [:show, :create] do
    resources :coin_bookmarks, only: [:new, :create, :destroy]
  end
end
