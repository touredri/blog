# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'User Show Page', type: :feature do
  before do
    # Create a user with posts and comments to test the view
    @user = User.create(name: 'John Doe', photo: 'imageprofileurl.jpg', bio: 'I am a user.')
    @post1 = @user.posts.create(title: 'Post 1', text: 'This is post 1.')
    @post2 = @user.posts.create(title: 'Post 2', text: 'This is post 2.')
    @post3 = @user.posts.create(title: 'Post 3', text: 'This is post 3.')
    @comment1 = @post1.comments.create(text: 'Comment 1', author: @user)
    @comment2 = @post1.comments.create(text: 'Comment 2', author: @user)
    @comment3 = @post2.comments.create(text: 'Comment 3', author: @user)
    visit user_path(@user)
  end

  it 'displays the user profile picture' do
    expect(page).to have_css("img[src*='imageprofileurl.jpg']")
  end

  it 'displays the user username' do
    expect(page).to have_content(@user.name)
  end

  it 'displays the number of posts the user has written' do
    expect(page).to have_content('Number of posts:3')
  end

  it 'displays the user bio' do
    expect(page).to have_content(@user.bio)
  end

  it 'displays the first 3 posts of the user' do
    expect(page).to have_content('Post: #1')
    expect(page).to have_content('Post: #2')
    expect(page).to have_content('Post: #3')
  end

  it 'redirects to a post show page when clicking on a post' do
    click_link 'See more', match: :first
    expect(current_path).to eq(user_post_path(@user, @post3))
  end

  it 'redirects to the user post index page when clicking on "See all posts"' do
    click_link 'See all post'
    expect(current_path).to eq(user_posts_path(@user))
  end
end
