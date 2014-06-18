# ProspectCard routes spec
require 'spec_helper'

describe 'routing for prospect_cards' do
  it 'routes /prospect_cards to prospect_cards#index' do
    expect(:get => '/prospect_cards').to route_to(
      :action => 'index',
      :controller => 'prospect_cards'
      )
  end

  it 'routes /prospect_cards/new to prospect_cards#new' do
    expect(:get => '/prospect_cards/new').to route_to(
      :action => 'new',
      :controller => 'prospect_cards'
      )
  end

  it 'routes /prospect_cards to prospect_cards#create' do
    expect(:post => '/prospect_cards').to route_to(
      :action => 'create',
      :controller => 'prospect_cards'
      )
  end

  it 'routes /prospect_cards/:id/edit to prospect_cards#edit' do
    expect(:get => '/prospect_cards/1/edit').to route_to(
      :action => 'edit',
      :controller => 'prospect_cards',
      :id => '1'
      )
  end

  it 'routes /prospect_cards/:id to prospect_cards#show' do
    expect(:get => '/prospect_cards/1').to route_to(
      :action => 'show',
      :controller => 'prospect_cards',
      :id => '1'
      )
  end

  it 'routes /prospect_cards/:id to prospect_cards#update using PUT' do
    expect(:put => '/prospect_cards/1').to route_to(
      :action => 'update',
      :controller => 'prospect_cards',
      :id => '1'
      )
  end

  it 'routes /prospect_cards/:id to prospect_cards#update using PATCH' do
    expect(:patch => '/prospect_cards/1').to route_to(
      :action => 'update',
      :controller => 'prospect_cards',
      :id => '1'
      )
  end

  it 'routes /prospect_cards/:id to prospect_cards#destroy' do
    expect(:delete => '/prospect_cards/1').to route_to(
      :action => 'destroy',
      :controller => 'prospect_cards',
      :id => '1'
      )
  end
end
