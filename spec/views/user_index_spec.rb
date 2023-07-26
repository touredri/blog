# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'User Index Page', type: :feature do
  before do
    # Create some users and posts to test the view
    @user1 = User.create(name: 'John Doe', photo: 'profile_url', bio: 'I am a user.')
    @user2 = User.create(name: 'Jane Smith', photo: 'profile_url', bio: 'I am another user.')
    @user3 = User.create(name: 'Bob Johnson', photo: 'profile_url', bio: 'I am yet another user.')
    # Create some posts for each user
    @user1.posts.create(title: 'Post 1', text: 'This is post 1.')
    @user2.posts.create(title: 'Post 2', text: 'This is post 2.')
    @user3.posts.create(title: 'Post 3', text: 'This is post 3.')
    visit users_path
  end

  it 'displays the username of all other users' do
    expect(page).to have_content(@user1.name)
    expect(page).to have_content(@user2.name)
    expect(page).to have_content(@user3.name)
  end

  it 'displays the profile picture for each user' do
    expect(page).to have_css("img[src*='profile_url']", count: 3)
  end

  it 'displays the number of posts each user has written' do
    expect(page).to have_content('Number of posts:1', count: 3)
  end

  it 'redirects to the user show page when clicking on a user' do
    click_link @user1.name
    expect(current_path).to eq(user_path(@user1))
  end

  it 'redirects to the new post form when clicking the "Add post" button' do
    click_link 'Add post'
    expect(current_path).to eq(new_post_path)
  end
end
