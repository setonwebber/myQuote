Rails.application.routes.draw do

  # creats login for sessions, get for new, post for create (create in the controller, starting the session), and /logout for destroy (logging out)
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  # creates all the urls for the header or anywhere that needs it 
  get '/admin', to: 'home#aindex'
  get '/userhome', to: 'home#uindex'
  get '/your-quotes', to: 'home#uquotes'
  get '/search', to: 'search#index'
  get '/upload', to: 'quotes#new'
  get '/signup', to: 'users#new'
  get '/quotes', to: 'quotes#index'

  # sets the home/index view to the root url of the website.
  root 'home#index'

  # the models urls, default GET POST DELETE stuff.
  resources :categories
  resources :quotes
  resources :philosophers
  resources :users
end
