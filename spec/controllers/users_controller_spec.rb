require 'spec_helper'

describe UsersController do

  # NEW
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

  # CREATE
  describe 'POST create' do
    before :each do
      post :create, {:user => {first_name: 'Kathew', last_name: 'Bod', email: 'boddabing@example.com', password: 'password'}}
    end

    it 'responds with a redirect' do
      actual = response.code
      expected = '302'
      expect(actual).to eq(expected)
    end

    it 'inserts a user record' do
      actual = User.last.first_name
      expected = 'Kathew'
      expect(actual).to eq(expected)
    end

    it 'redirects to prospect_cards_path' do
      response.should redirect_to login_path
    end
  end # POST create

end # UserController
