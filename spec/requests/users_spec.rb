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
      get '/users'
      expect(response.body).to include('Hello world')
    end
  end
  describe 'Get /show' do
    it 'should show the placeholder' do
      get '/users/1'
      expect(response.body).to include('This is the list of a user with id')
    end
  end
end

RSpec.describe 'Show', type: :request do
  describe 'GET /show' do
    it 'returns a successful response' do
      get '/users/show'
      expect(response).to be_successful
    end

    it 'renders the show template' do
      get '/users/show'
      expect(response).to render_template('show')
    end
  end
end
