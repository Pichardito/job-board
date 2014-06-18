require 'spec_helper'

describe RecruiterCardsController do

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

    describe 'given a recruiter_card' do

      before :each do
        @recruiter_card_test = RecruiterCard.new
        @recruiter_card_test.name = 'Oracle'
        @recruiter_card_test.title = 'CEO'
        @recruiter_card_test.looking_for = 'Help'
        @recruiter_card_test.description = '...'
        @recruiter_card_test.save!
      end

      describe 'GET show' do
        before :each do
          get :show, :id => @recruiter_card_test.id
        end

        it 'responds successfully' do
          actual = response.code
          expected = '200'
          expect(actual).to eq(expected)
        end

        it 'assigns @recruiter_card' do
          actual = assigns(:recruiter_card_test)
          expected = @recruiter_card
          expect(actual).to eq(expected)
        end

        it 'renders the show template' do
          expect(response).to render_template('show')
        end
      end # describe GET

      describe 'GET edit' do
        before :each do
          get :edit, :id => @recruiter_card_test.id
        end

        it 'responds successfully' do
          actual = response.code
          expected = '200'
          expect(actual).to eq(expected)
        end

        it 'assigns @recruiter_card' do
          actual = assigns(:recruiter_card_test)
          expected = @recruiter_card
        end

        it 'renders the edit template' do
          expect(response).to render_template('edit')
        end
      end #describe GET edit

      describe 'POST update' do
        before :each do
          post :update, {:id => @recruiter_card_test.id, :recruiter_card => { name: 'Elon Musk', title: 'Entrepreneur', looking_for: 'engineers', description: 'come work for Tesla!', left_pos: 100, top_pos: 100 }}
        end

        it 'updates the RecruiterCard record' do
          @recruiter_card_test.reload

          actual = @recruiter_card_test.name
          expected = 'Elon Musk'
          expect(actual).to eq(expected)

          actual = @recruiter_card_test.title
          expected = 'Entrepreneur'
          expect(actual).to eq(expected)

          actual = @recruiter_card_test.looking_for
          expected = 'engineers'
          expect(actual).to eq(expected)

          actual = @recruiter_card_test.description
          expected = 'come work for Tesla!'
          expect(actual).to eq(expected)

          actual = @recruiter_card_test.left_pos
          expected = 100
          expect(actual).to eq(expected)

          actual = @recruiter_card_test.top_pos
          expect(actual).to eq(expected)
        end

        it "responds with JSON" do
          response.header['Content-Type'].should include 'application/json'
        end

      end #describe POST update

      describe 'DELETE destroy' do
        it 'destroys a recruiter_card record' do
          expect {delete :destroy, { :id => @recruiter_card_test.id }}
            .to change(RecruiterCard, :count).by(-1)
          end
      end # describe DELETE destroy

    end #Given a recruiter card

    describe 'GET new' do

        before :each do
          get :new
        end

        it 'responds successfully' do
          actual = response.code
          expected = '200'
          expect(actual).to eq(expected)
        end

        it 'renders the NEW template' do
          expect(response).to render_template('new')
        end

    end # describe GET new

    describe 'POST create' do

        before :each do
          post :create, {:recruiter_card => { name: 'Oracle', title: 'CEO', looking_for: 'Developer', description: '...' }}
        end

        it 'responds with a redirect' do
          actual = response.code
          expected = '302'
          expect(actual).to eq(expected)
        end

    end #describe POST create
  end # Given a logged in user
end #RecruiterCardsController
