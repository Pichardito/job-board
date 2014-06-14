require 'spec_helper'

describe RecruiterCardsController do

  describe 'given a recruiter_card' do

    # before :each do
    #   @recruiter_card = RecruiterCard.new
    #   @recruiter_card.name = 'Oracle'
    #   @recruiter_card.save
    # end

  end #Given a recruiter card

  # -- NEW --
  describe 'GET new' do
    before :each do
      get :new
    end

    it 'responds successfully' do
      actual = response.code
      expected = '200'
      expect(actual).to eq(expected)
    end

  end # describe GET new

end #RecruiterCardsController
