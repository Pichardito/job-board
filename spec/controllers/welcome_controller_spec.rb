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

<<<<<<< HEAD
    end # GET index

end #WelcomeController
=======
    end # GET INDEX

end #WelcomeController
>>>>>>> cfd03295c1876f2e9279e0f91566040d539ee98f
