Rails.application.routes.draw do
  
  resources :user_stocks, only: [:create, :destroy]
  resources :freindships, only: [:create, :destroy]
  get 'my_portfolio', to: 'users#my_portfolio'
  get 'my_friends', to:'users#my_freinds'
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "welcome#home"

  get 'stocks_search', to:'stocks#search'
  get 'freinds_search', to:'users#search'
  resources :users, only: [:show]
end

