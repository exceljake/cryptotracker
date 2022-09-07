Rails.application.routes.draw do
  resources :wallets do 
    resources :cryptocurrencies do 
    end
  end
  get "all", to: "cryptocurrencies#all_cryptocurrencies"
  mount_devise_token_auth_for 'User', at: 'auth'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  root "wallets#index"
end
