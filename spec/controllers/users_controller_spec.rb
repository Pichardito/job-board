require 'spec_helper'

describe UsersController do

  describe 'given a user' do
    before :each do
      @bod = User.new
      @bod.first_name = 'Bod'
      @bod.last_name = 'Bing'
      @bod.email = 'bod@example.com'
      @bod.password = 'password'
      @bod.id = 1
      @bod.save!
    end

    # SHOW
    describe 'GET show' do
      before :each do
        get :show, :id => @bod.id
      end

      it 'responds successfully' do
        actual = response.code
        expected = '200'
        expect(actual).to eq(expected)
      end

      it 'assigns @user' do
        actual = assigns(:user)
        expected = @bod
        expect(actual).to eq(expected)
      end

      it 'renders the show template' do
        expect(response).to render_template('show')
      end
    end # GET show

    # EDIT
    describe 'GET edit' do
      before :each do
        get :edit, id: @bod.id
      end

      it 'responds successfully' do
        actual = response.code
        expected = '200'
        expect(actual).to eq(expected)
      end

      it 'assigns @user' do
        actual = assigns(:user)
        expected = @bod
        expect(actual).to eq(expected)
      end

      it 'renders the edit template' do
        expect(response).to render_template('edit')
      end
    end # GET edit

    # Update
    describe 'POST update' do
      before :each do
        post :update, {:id => @bod.id, :user => {first_name: 'Lebron', last_name: 'James', email: 'lebron@example.com', password: 'password'}}
      end

      it 'responds with a redirect' do
        actual = response.code
        expected = '302'
        expect(actual).to eq(expected)
      end

      it 'updates user record' do
        @bod.reload
        actual = @bod.first_name
        expected = 'Lebron'
        expect(actual).to eq(expected)
      end

      it 'redirects to show' do
        response.should redirect_to user_path(@bod)
      end
    end # POST update

    describe 'DELETE destroy' do
      it 'deletes a user record' do
        expect { delete :destroy, {:id => @bod.id}}
          .to change(User, :count).by(-1)
      end
    end # DELETE destroy

  end # Given a user



  # NEW
  describe 'GET new' do
    before :each do
      get :new
    end

    it 'responds successfully' do
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
