require 'spec_helper'

describe UsersController do

  describe 'given a user' do
    before :each do
      @corey = User.new
      @corey.name = 'Corey'
      @corey.save
    end

end

end # UserController
