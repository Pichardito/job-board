Rails.application.routes.draw do

  root to: 'welcome#index'

# Cards
  get '/cards' => 'prospect_cards#index'
  get '/cards/new' => 'prospect_cards#new', as: 'new_card'
  post '/cards/new' => 'prospect_cards#create'
  get '/cards/show' => 'prospect_cards#show', as: 'show'


# LinkedIn
  get '/auth/:provider/callback' => 'sessions#create'
  get '/auth/failure' => 'welcome#index'
  get '/logout' => 'sessions#destroy'

end
