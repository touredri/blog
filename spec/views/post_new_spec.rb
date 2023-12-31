# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'New Post Page', type: :feature do
  before do
    # Create a user to test the form
    @user = User.create(name: 'John Doe', photo: 'profile_url', bio: 'I am a user.')
    visit new_post_path
  end
  it 'not creates a new post when submitting the form with invalid data' do
    fill_in 'post_title', with: 'Test Post'
    fill_in 'post_text', with: ''
    click_button 'Create Post'
    visit user_path(@user)
    expect(page).to_not have_content('This is a test post')
  end
end
