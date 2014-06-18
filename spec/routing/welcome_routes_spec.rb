# Welcome route spec
require 'spec_helper'

describe 'routing for root' do
  it 'routes / to welcome#index' do
    expect(:get => '/').to route_to(
      :action => 'index',
      :controller => 'welcome'
      )
  end
end
