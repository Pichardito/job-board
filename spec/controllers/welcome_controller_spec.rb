require 'spec_helper'

describe WelcomeController do

 # --- INDEX ---
    describe 'GET index' do
      before :each do
        get :root
      end

      it 'responds successfully' do
        actual = response.code
        expected = '200'
        expect(actual).to eq(expected)
      end

    end # GET INDEX

end #WelcomeController
