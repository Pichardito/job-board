# LinkedIn routes spec
require 'spec_helper'

describe 'routing for linked_in' do
  it 'routes /auth/:provider/callback to sessions#create' do
    expect(:get => '/auth/:provider/callback').to route_to(
      :controller => 'sessions',
      :action => 'create',
      :provider => ':provider'
      )
  end

  it 'routes /auth/failure to welcome#index' do
    expect(:get => '/auth/failure').to route_to(
      :controller => 'welcome',
      :action => 'index'
      )
  end
end
