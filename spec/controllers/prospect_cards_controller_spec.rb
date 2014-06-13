require 'spec_helper'

describe ProspectCardsController do


    # --- INDEX ---
    describe 'GET index' do
      before :each do
        get :index
      end

      it 'responds successfully' do
        actual = response.code
        expected = '200'
        expect(actual).to eq(expected)
      end

      it '' do
        actual = 
        expected = 
        expect(actual).to eq(expected)
      end

    end # GET index

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



  end # GET new

  # --- CREATE ---
  describe 'POST create' do
    before :each do
      post :create, {:person => {name: 'Carlos Pichardo'}}
    end

    it "assigns a newly created prospect card as prospect_card" do
        post :create
        assigns(prospect_card).should be_a(ProspectCard)
      end

    it "redirects to created prospect card" do
      response.should redirect_to (ProspectCard.last)
    end

  end #POST CREATE


    # --- SHOW ---
    describe 'GET show' do
      before :each do
        get :show, :id => @prospect.id
      end

      it 'responds successfully' do
        actual = response.code
        expected = '200'
        expect(actual).to eq(expected)
      end

      it '' do
        actual = 
        expected = 
        expect(actual).to eq(expected)
      end

      it 'renders the show template' do
        expect(response).to render_template('show')
      end

    end # GET show


    # --- EDIT ---
    describe 'GET edit' do
      before :each do
        get :edit, :id => @prospect.id
      end

      it 'responds successfully' do
        actual = response.code
        expected = '200'
        expect(actual).to eq(expected)
      end

      it '' do
        actual = 
        expected = 
        expect(actual).to eq(expected)
      end

      it 'renders the edit template' do
        expect(response).to render_template('edit')
      end

    end # GET edit

    # --- UPDATE ---
    describe 'POST update' do

      before :each do
        post :update, {:id => @andre.id, :person => {name: 'nondre'}}
      end

      it "responds with a redirect" do
        actual = response.code
        expected = '302'
        expect(actual).to eq(expected)
      end

      it 'updates person record' do
        @andre.reload
        actual = @prospect.name
        expected = ''
        expect(actual).to eq(expected)
      end

      it "redirects to show" do
        response.should redirect_to person_path(@prospect)
      end

    end # POST update

    describe 'DELETE destroy' do
     it "destory prospect record" do
        expect { delete :destroy, {:id => @andre.id} }
          .to change(Prospect, :count).by(-1)
      end
    end

 




 

end # PeopleController