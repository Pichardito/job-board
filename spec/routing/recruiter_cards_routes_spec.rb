# RecruiterCard routes spec
require 'spec_helper'

describe 'routing for recruiter_cards' do
  it 'routes / to welcome#index' do
    expect(:get => '/').to route_to(
      :action => 'index',
      :controller => 'welcome'
      )
  end

end
