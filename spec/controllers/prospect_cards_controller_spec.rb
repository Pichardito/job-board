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

    end # GET index

  # TESTS CREATION OF NEW CARD
  #  # --- NEW ---
  # describe 'GET new' do
    # before :each do
    #   get :new
    # end

    # it 'responds successfully' do
    #   actual = response.code
    #   expected = '200'
    #   expect(actual).to eq(expected)
    # end

    # it "assigns a new prospect card as @prospect_card" do
    #   get :new
    #   assigns(:prospect_card).should be_a_new(ProspectCard)
    # end
  #end # GET new

  # --- CREATE ---

  # describe 'POST create' do
  #   before :each do
  #     post :create, {:person => {name: 'Carlos Pichardo'}}
  #   end

  #   it "assigns a newly created prospect card as prospect_card" do
  #       post :create
  #       assigns(prospect_card).should be_a(ProspectCard)
  #     end

  #   it "redirects to created prospect card" do
  #     response.should redirect_to (ProspectCard.last)
  #   end
  # end #POST CREATE


    # --- EDIT ---
    describe 'GET edit' do

      # it 'responds successfully' do
      #   actual = response.code
      #   expected = '200'
      #   expect(actual).to eq(expected)
      # end

      # it 'renders the edit template' do
      #   expect(response).to render_template('edit')
      # end

      it "edits the prospect card" do
        new_card = ProspectCard.new
        new_card.name = "Hi I'm a card"
        new_card.save
        post :update, {:id => @new_card.id, :ProspectCard => {name: "Hi I'm a prospect card" }}
        expect(new_card.name).to eq("Hi I'm a prospect card")
      end

    end # GET edit

    describe "DELETE or destroy" do

    it "deletes prospect_card" do
      new_card = ProspectCard.new
      new_card.name = "Hi I'm a card"
      new_card.save
      expect { delete :destroy, {:id => new_card.id} }
       .to change(ProspectCard, :count).by(-1)
    end

    # it "redirects to the prospect_cards list" do
    #   prospect_card = ProspectCard.create! valid_attributes
    #   delete :destroy, {:id => prospect_card.to_param}, valid_session
    #   expect(response).to redirect_to(prospect_cards_path)
    # end

  end #DELETE


end # ProspectCardsController
