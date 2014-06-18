# LinkedIn routes spec
require 'spec_helper'

describe 'routing for linked_in' do
  it 'routes /auth/:provider/callback to sessions#create' do
    expect(:get => '/auth/:provider/callback').to route_to(
      :action => 'create',
      :controller => 'sessions',
      :provider => ':provider'
      )
  end

  it 'routes /auth/failure to welcome#index' do
    expect(:get => '/auth/failure').to route_to(
      :action => 'index',
      :controller => 'welcome'
      )
  end
end
