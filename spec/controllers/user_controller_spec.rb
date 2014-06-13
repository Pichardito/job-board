require 'spec_helper'

describe UsersController do


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













end # UserController
