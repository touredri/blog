# frozen_string_literal: true

require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe 'GET #index' do
    it 'returns a successful response' do
      get :index
      expect(response).to be_successful
    end

    it 'renders the index template' do
      get :index
      expect(response).to render_template('index')
    end
  end
end

RSpec.describe 'Users', type: :request do
  describe 'GET /index' do
    it 'should show the placeholder' do
      get '/users/index'
      expect(response.body).to include('This is the list of a user with id')
    end
  end
end
