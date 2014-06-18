require 'spec_helper'

describe ProspectCardsController do

  describe 'given a logged in user' do
    before :each do
      @lebron = User.new
      @lebron.name = 'Lebron'
      @lebron.email = 'lebron@example.com'
      @lebron.password = 'password'
      @lebron.id = 6
      @lebron.save!
      session[:user_id] = @lebron.id
    end

    describe 'given a prospect_card' do

      before :each do
        @prospect_card_test = ProspectCard.new
        @prospect_card_test.name = 'Carlos'
        @prospect_card_test.title = 'Manager'
        @prospect_card_test.looking_for = 'employee'
        @prospect_card_test.description = 'this'
        @prospect_card_test.save!
      end


        # --- INDEX ---
    describe 'GET show' do

      before :each do
        get :index
      end

      it 'responds successfully' do
        actual = response.code
        expected = '200'
        expect(actual).to eq(expected)
      end

      it 'assigns @prospect_card' do
          actual = assigns(:prospect_card_test)
          expected = @prospect_card
          expect(actual).to eq(expected)
        end

    end # GET show

  # TESTS CREATION OF NEW CARD
   # --- NEW ---
  describe 'GET new' do
    before :each do
      get :new
    end

    it 'responds successfully' do
      actual = response.code
      expected = '200'
      expect(actual).to eq(expected)
    end

    it "assigns a new prospect card as @prospect_card" do
      get :new
      assigns(:prospect_card).should be_a_new(ProspectCard)
    end

    it 'renders the NEW template' do
      expect(response).to render_template('new')
    end
  end # GET new

  # --- CREATE ---


    # --- EDIT ---
    describe 'GET edit' do
      before :each do
          get :edit, :id => @prospect_card_test.id
        end

      it 'responds successfully' do
        actual = response.code
        expected = '200'
        expect(actual).to eq(expected)
      end

      it 'assigns @prospect_card' do
          actual = assigns(:prospect_card_test)
          expected = @prospect_card
        end

      it 'renders the edit template' do
        expect(response).to render_template('edit')
      end

    end # GET edit


    describe "POST update" do
      before :each do
            post :update, {:id => @prospect_card_test.id, :prospect_card => { name: 'Larry Page', title: 'Entrepreneur', looking_for: 'computer scientists', description: 'come work for Google!', left_pos: 100, top_pos: 100 }}
      end

      it "updates the ProspectCard record" do
        @prospect_card_test.reload

        actual = @prospect_card_test.name
        expected = 'Larry Page'
        expect(actual).to eq(expected)

        actual = @prospect_card_test.title
        expected = 'Entrepreneur'
        expect(actual).to eq(expected)

        actual = @prospect_card_test.looking_for
        expected = 'computer scientists'
        expect(actual).to eq(expected)

        actual = @prospect_card_test.description
        expected = 'come work for Google!'
        expect(actual).to eq(expected)

        actual = @prospect_card_test.left_pos
        expected = 100
        expect(actual).to eq(expected)

        actual = @prospect_card_test.top_pos
        expect(actual).to eq(expected)
      end

      it "responds with JSON" do
        response.header['Content-Type'].should include 'application/json'
      end
    end # POST update


    describe "DELETE destroy" do

      it "deletes prospect_card" do
        expect { delete :destroy, {:id => @prospect_card_test.id }}
         .to change(ProspectCard, :count).by(-1)
      end

    end # DELETE destroy
  end # Given a prospect card

    describe 'POST create' do

      before :each do
        post :create, {:prospect_card => { name: 'Carlos', title: 'manager', looking_for: 'employee', description: 'this' }}
      end

      it 'responds with a redirect' do
        actual = response.code
        expected = '302'
        expect(actual).to eq(expected)
      end
    end #describe POST create
  end # Given a logged in user
end # ProspectCardsController
