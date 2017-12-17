Rails.application.routes.draw do
  resources :wishlist_accounts
  resources :bank_accounts
  get '/chart_of_accounts', to: 'chart_of_accounts#index'
  get '/withdraw', to: 'withdraw#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'home#index'
end
