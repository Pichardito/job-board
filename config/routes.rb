Rails.application.routes.draw do

  root to: 'welcome#index'

  get '/cards' => 'prospect_cards#index'

  get '/auth/linkedin/callback' => 'user#show'

end
