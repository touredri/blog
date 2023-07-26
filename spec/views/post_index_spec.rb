# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'User Post Index Page', type: :feature do
  before do
    # Create a user with posts and comments to test the view
    @user = User.create(name: 'John Doe', photo: 'profile_url', bio: 'I am a user.')
    @post1 = @user.posts.create(title: 'Post 1', text: 'This is post 1.')
    @post2 = @user.posts.create(title: 'Post 2', text: 'This is post 2.')
    @post3 = @user.posts.create(title: 'Post 3', text: 'This is post 3.')
    @comment1 = @post1.comments.create(text: 'Comment 1', author: @user)
    @comment2 = @post1.comments.create(text: 'Comment 2', author: @user)
    @comment3 = @post2.comments.create(text: 'Comment 3', author: @user)
    visit user_posts_path(@user)
  end

  it 'displays the user profile picture' do
    # Add your Capybara code here to test for the profile picture
  end

  it 'displays the user username' do
    expect(page).to have_content(@user.name)
  end

  it 'displays the number of posts the user has written' do
    expect(page).to have_content('Number of posts:3')
  end

  it 'displays a post title and part of its body' do
    expect(page).to have_content(@post1.title)
    expect(page).to have_content(@post2.title)
    expect(page).to have_content(@post3.title)
    expect(page).to have_content(@post1.text[0..200]) # Truncated text
    expect(page).to have_content(@post2.text[0..200]) # Truncated text
    expect(page).to have_content(@post3.text[0..200]) # Truncated text
  end

  it 'displays the first comments on a post' do
    expect(page).to have_content(@comment1.text)
    expect(page).to have_content(@comment2.text)
    expect(page).to have_content(@comment3.text)
  end

  it 'displays the number of comments and likes a post has' do
    expect(page).to have_content('Comments: 2') # Assuming 2 comments for post1
    expect(page).to have_content('Likes: 0')   # Assuming 0 likes for all posts
  end

  it "redirects to a post show page when clicking on a post's see more" do
    click_link 'See More', match: :first
    expect(current_path).to eq(user_post_path(@user, @post3))
  end
end
