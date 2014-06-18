# RecruiterCard routes spec
require 'spec_helper'

describe 'routing for recruiter_cards' do
  it 'routes /recruiter_cards to recruiter_cards#index' do
    expect(:get => '/recruiter_cards').to route_to(
      :action => 'index',
      :controller => 'recruiter_cards'
      )
  end

  it 'routes /recruiter_cards/new to recruiter_cards#new' do
    expect(:get => '/recruiter_cards/new').to route_to(
      :action => 'new',
      :controller => 'recruiter_cards'
      )
  end

  it 'routes /recruiter_cards to recruiter_cards#create' do
    expect(:post => '/recruiter_cards').to route_to(
      :action => 'create',
      :controller => 'recruiter_cards'
      )
  end

  it 'routes /recruiter_cards/new to recruiter_cards#new' do
    expect(:get => '/recruiter_cards/new').to route_to(
      :action => 'new',
      :controller => 'recruiter_cards'
      )
  end

  it 'routes /recruiter_cards/:id/edit to recruiter_cards#edit' do
    expect(:get => '/recruiter_cards/1/edit').to route_to(
      :action => 'edit',
      :controller => 'recruiter_cards',
      :id => '1'
      )
  end

  it 'routes /recruiter_cards/:id to recruiter_cards#show' do
    expect(:get => '/recruiter_cards/1').to route_to(
      :action => 'show',
      :controller => 'recruiter_cards',
      :id => '1'
      )
  end

  it 'routes /recruiter_cards/:id to recruiter_cards#update using PUT' do
    expect(:put => '/recruiter_cards/1').to route_to(
      :action => 'update',
      :controller => 'recruiter_cards',
      :id => '1'
      )
  end

  it 'routes /recruiter_cards/:id to recruiter_cards#update using PATCH' do
    expect(:patch => '/recruiter_cards/1').to route_to(
      :action => 'update',
      :controller => 'recruiter_cards',
      :id => '1'
      )
  end

  it 'routes /recruiter_cards/:id to recruiter_cards#destroy' do
    expect(:delete => '/recruiter_cards/1').to route_to(
      :action => 'destroy',
      :controller => 'recruiter_cards',
      :id => '1'
      )
  end
end
