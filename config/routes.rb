Rails.application.routes.draw do
  
  resources :user_stocks
  get 'my_portfolio', to: 'users#my_portfolio'
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "welcome#home"

  get 'stocks_search', to:'stocks#search'

end

