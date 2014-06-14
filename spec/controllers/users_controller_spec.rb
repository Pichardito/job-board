require 'spec_helper'

describe UsersController do

  # ***NEW***
  describe 'GET new' do
    before :each do
      get :new
    end

    it 'responds normally' do
      actual = response.code
      expected = '200'
      expect(actual).to eq(expected)
    end

    it 'renders the new template' do
      expect(response).to render_template('new')
    end
  end # GET new


end # UserController
