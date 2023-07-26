# frozen_string_literal: true

require 'rails_helper'

RSpec.describe PostsController, type: :request do
  describe 'GET /index' do
    let!(:user) { User.create(name: 'Test User', photo: 'img_url', bio: 'test@example.com') }

    it 'returns a success response' do
      get "/users/#{user.id}/posts"
      expect(response).to be_successful
    end

    it 'renders the index template of views/users' do
      get "/users/#{user.id}/posts"
      expect(response).to render_template(:index)
    end

    it 'includes the correct placeholder text' do
      get "/users/#{user.id}/posts"
      result = response.body
      expect(result).to include(user.name.to_s)
    end
  end

  describe 'GET #show' do
    let!(:user) { User.create(name: 'Test User', photo: 'img_url', bio: 'test@example.com') }
    let!(:post) { user.posts.create(title: 'Test Post', text: 'Test content') }

    it 'returns a success response' do
      get "/users/#{user.id}/posts/#{post.id}"
      expect(response).to have_http_status(200)
    end

    it 'renders the show template' do
      get "/users/#{user.id}/posts/#{post.id}"
      expect(response).to render_template(:show)
    end

    it 'includes the correct placeholder text' do
      get "/users/#{user.id}/posts/#{post.id}"
      result = response.body
      expect(result).to include('Post')
    end
  end
end
