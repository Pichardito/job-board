# User routes spec
require 'spec_helper'

describe 'routing for users' do

    it 'routes /signup to users#new' do
      expect(:get => '/signup').to route_to(
        :action => 'new',
        :controller => 'users'
        )
    end

    it 'routes /users to users#create' do
      expect(:post => '/users').to route_to(
        :action => 'create',
        :controller => 'users'
        )
    end

    it 'routes /users/:id to users#show' do
      expect(:get => '/users/1').to route_to(
        :action => 'show',
        :controller => 'users',
        :id => '1'
        )
    end

    it 'routes /users/:id/edit to users#edit' do
      expect(:get => '/users/1/edit').to route_to(
        :action => 'edit',
        :controller => 'users',
        :id => '1'
        )
    end

    it 'routes /users/:id to users#update using put' do
      expect(:put => '/users/1').to route_to(
        :action => 'update',
        :controller => 'users',
        :id => '1'
        )
    end

    it 'routes /users/:id to users#update using patch' do
      expect(:patch => '/users/1').to route_to(
        :action => 'update',
        :controller => 'users',
        :id => '1'
        )
    end

    it 'routes /users/:id to users#destroy' do
      expect(:delete => '/users/1').to route_to(
        :action => 'destroy',
        :controller => 'users',
        :id => '1'
        )
    end
end # routing for users
