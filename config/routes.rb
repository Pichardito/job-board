Rails.application.routes.draw do

  root to: 'welcome#index'

# # Cards

resources :prospect_cards, except: [:destroy, :edit, :update]

# LinkedIn
  get '/auth/:provider/callback' => 'sessions#create'
  get '/auth/failure' => 'welcome#index'
  get '/logout' => 'sessions#destroy'

end
