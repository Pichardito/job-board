Rails.application.routes.draw do

  root to: 'welcome#index'

# # Cards

resources :prospect_cards

# LinkedIn
  get '/auth/:provider/callback' => 'sessions#create'
  get '/auth/failure' => 'welcome#index'

# Session Routes
  delete '/logout' => 'sessions#destroy'

# Sorcery Authentication

  get '/login' => 'sessions#new', as: 'login'
  post '/sessions' => 'sessions#create', as: 'sessions'
  get 'signup' => 'users#new', as: 'signup'
  post '/users' => 'users#create', as: 'users'
  get '/profile' => 'users#profile', as: 'profile'
  delete '/users/:id' => 'users#destroy'

end
