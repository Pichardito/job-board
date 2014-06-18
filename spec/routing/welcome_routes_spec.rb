# Welcome route spec
require 'spec_helper'

describe 'routing to root' do
  it 'routes / to welcome#index' do
    expect(:get => '/').to route_to(
      :controller => 'welcome',
      :action => 'index'
      )
  end
end
