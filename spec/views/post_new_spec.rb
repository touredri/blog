require 'rails_helper'
RSpec.describe 'New Post Page', type: :feature do
  before do
    # Create a user to test the form
    @user = User.create(name: 'John Doe', photo: 'profile_url', bio: 'I am a user.')
    visit new_post_path
  end
  it 'creates a new post when submitting the form with valid data' do
    fill_in "post_title", with: "Test Post"
    fill_in "post_text", with: "This is a test post."
    click_button "Create Post"
    visit user_path(@user)
    expect(page).to have_content("Test Post")
  end
end# frozen_string_literal: true
