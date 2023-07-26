# frozen_string_literal: true
require 'rails_helper'
RSpec.describe 'New Comment Page', type: :feature do
  before do
    # Create a user with a post to test the form
    @user = User.create(name: 'John Doe', bio: 'I am a user.')
    @post = @user.posts.create(title: 'Test Post', text: 'This is a test post.')
    visit new_post_comment_path(@post)
  end
  it 'creates a new comment when submitting the form with valid data' do
    fill_in "comment_text", with: "This is a test comment."
    click_button "Create comment"
    expect(page).to have_content("This is a test comment")
  end
end
