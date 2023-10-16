Rails.application.routes.draw do
  get 'search/index'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  get '/admin', to: 'home#aindex'
  get '/userhome', to: 'home#uindex'
  get '/your-quotes', to: 'home#uquotes'
  get '/editaccount', to: 'home#uedit'
  
  root 'home#index'


  resources :quote_categories
  resources :categories
  resources :quotes
  resources :philosophers
  resources :users
end
