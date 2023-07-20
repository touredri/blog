# frozen_string_literal: true

require 'rails_helper'

RSpec.describe PostsController, type: :request do
  describe 'GET /index' do
    it 'returns a success response' do
      get '/users/745/posts'
      expect(response).to be_successful
    end

    it 'renders the index template of views/users' do
      get '/users/745/posts'
      expect(response).to render_template(:index)
    end

    it 'includes the correct placeholder text' do
      get '/users/745/posts'
      result = response.body
      expect(result).to include('this the list of all the users')
    end

    describe 'GET #show' do
      it 'returns a success response' do
        get '/users/745/posts/3'

        expect(response).to have_http_status(200)
      end

      it 'renders the show template' do
        get '/users/745/posts/3'
        expect(response).to render_template(:show)
      end

      it 'includes the correct placeholder text' do
        get '/users/745/posts/3'
        result = response.body
        expect(result).to include('This is the list of a post with id:')
      end
    end
  end
end
