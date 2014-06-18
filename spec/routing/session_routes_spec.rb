# Session routes spec
require 'spec_helper'

describe 'routing for sessions' do
  it 'routes /login to sessions#new' do
    expect(:get => '/login').to route_to(
      :controller => 'sessions',
      :action => 'new'
      )
  end

  it 'routes /sessions to sessions#create' do
    expect(:post => '/sessions').to route_to(
      :controller => 'sessions',
      :action => 'create'
      )
  end

  it 'routes /logout to sessions#destroy' do
    expect(:delete => '/logout').to route_to(
      :controller => 'sessions',
      :action => 'destroy'
      )
  end
end
