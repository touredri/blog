# frozen_string_literal: true

require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe 'GET #index' do
    let!(:user) { User.create(name: 'Test User', photo: 'img_url', bio: 'test@example.com') }
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
      expect(response.body).to include('All Users')
    end
  end
  describe 'Get /show' do
    let!(:user) { User.create(name: 'Test User', photo: 'img_url', bio: 'test@example.com') }
    it 'should show the placeholder' do
      get "/users/#{user.id}"
      expect(response.body).to include('Bio')
    end
  end
end

RSpec.describe 'Show', type: :request do
  describe 'GET /show' do
    let!(:user) { User.create(name: 'Test User', photo: 'img_url', bio: 'test@example.com') }
    it 'returns a successful response' do
      get "/users/#{user.id}"
      expect(response).to be_successful
    end

    it 'renders the show template' do
      get "/users/#{user.id}"
      expect(response).to render_template('show')
    end
  end
end
