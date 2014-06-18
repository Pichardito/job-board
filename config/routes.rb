Rails.application.routes.draw do

  root to: 'welcome#index'

# Cards

resources :prospect_cards
resources :recruiter_cards

  post '/prospect_cards/:id' => 'prospect_cards#update'

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
  delete '/users/:id' => 'users#destroy', as: 'destroy_user'

  resources :users, only: [:show, :edit, :update]

  # Like Routes
  post '/prospect_cards/:id/like' => 'prospect_cards#like', as: 'prospect_card_like'
  post '/recruiter_cards/:id/like' => 'recruiter_cards#like', as: 'recruiter_card_like'

end
