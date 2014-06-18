# Session routes spec
require 'spec_helper'

describe 'routing for sessions' do
  it 'routes /login to sessions#new' do
    expect(:get => '/login').to route_to(
      :action => 'new',
      :controller => 'sessions'
      )
  end

  it 'routes /sessions to sessions#create' do
    expect(:post => '/sessions').to route_to(
      :action => 'create',
      :controller => 'sessions'
      )
  end

  it 'routes /logout to sessions#destroy' do
    expect(:delete => '/logout').to route_to(
      :action => 'destroy',
      :controller => 'sessions'
      )
  end
end
