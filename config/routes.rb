Rails.application.routes.draw do
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  get '/admin', to: 'home#aindex'
  get '/userhome', to: 'home#uindex'
  get '/your-quotes', to: 'home#uquotes'
  get '/search', to: 'search#index'
  get '/upload', to: 'quote#new'
  
  root 'home#index'

  resources :quote_categories
  resources :categories
  resources :quotes
  resources :philosophers
  resources :users
end
