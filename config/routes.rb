Rails.application.routes.draw do

  root to: 'welcome#index'

# # Cards

resources :prospect_cards
resources :recruiter_cards

# LinkedIn
  get '/auth/:provider/callback' => 'sessions#create'
  get '/auth/failure' => 'welcome#index'

# Session Routes
  get '/login' => 'sessions#new', as: 'login'
  post '/sessions' => 'sessions#create', as: 'sessions'
  delete '/logout' => 'sessions#destroy'

# Sorcery Authentication


  get 'signup' => 'users#new', as: 'signup'
  post '/users' => 'users#create', as: 'users'
  delete '/users/:id' => 'users#destroy'

  resources :users, only: [:show, :edit, :update]

end
