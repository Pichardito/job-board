Rails.application.routes.draw do

  root to: 'welcome#index'

  get '/cards' => 'prospect_cards#index'

  get '/auth/:provider/callback' => 'sessions#create'
  get '/auth/failure' => 'welcome#index'
  get '/logout' => 'sessions#destroy'

end
