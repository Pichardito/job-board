Rails.application.routes.draw do

  root to: 'welcome#index'

  get '/cards' => 'prospect_cards#index'

  get '/cards/new' => 'prospect_cards#new', as: 'new_card'
  post '/cards/new' => 'prospect_cards#create'

  get '/cards/show' => 'prospect_cards#show', as: 'show'

  get '/auth/linkedin/callback' => 'user#show'

end
