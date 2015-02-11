require 'rails_helper'

RSpec.describe AccountsController do
  let(:valid_attributes) {
    { name: 'test name' }
  }

  let(:invalid_attributes) {
    { name: nil }
  }

  describe 'GET index' do
    it 'has a 200 status code' do
      get :index
      expect(response.status).to eq 200
    end

    it 'renders the index template' do
      get:index
      expect(response).to render_template('index')
    end

    it 'assigns @accounts' do
      accounts = Account.all
      get :index
      expect(assigns(:accounts)).to eq accounts
    end
  end

  describe 'GET new' do
    it 'has a 200 status code' do
      get :new
      expect(response.status).to eq 200
    end

    it 'renders the new template' do
      get :new
      expect(response).to render_template('new')
    end

    it 'assigns @account' do
      get :new
      expect(assigns(:account)).to be_a_new Account
    end
  end
end