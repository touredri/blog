# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'User Post Index Page', type: :feature do
  before do
    # Create a user with posts and comments to test the view
    @user = User.create(name: 'John Doe', photo: 'profile_url', bio: 'I am a user.')
    @user_posts = []
    10.times do |i|
      @user_posts << @user.posts.create(title: "Post #{i + 1}", text: "This is post #{i + 1}.")
    end
    @comment1 = @user_posts[9].comments.create(text: 'Comment 1', author: @user)
    @comment2 = @user_posts[8].comments.create(text: 'Comment 2', author: @user)
    @comment3 = @user_posts[7].comments.create(text: 'Comment 3', author: @user)
    visit user_posts_path(@user)
  end

  it 'displays the user profile picture' do
    expect(page).to have_css("img[src*='profile_url']")
  end

  it 'displays the user username' do
    expect(page).to have_content(@user.name)
  end

  it 'displays the number of posts the user has written' do
    expect(page).to have_content('Number of posts:10')
  end

  it 'displays a post title and part of its body' do
    expect(page).to have_content(@user_posts[9].title)
    expect(page).to have_content(@user_posts[8].title)
    expect(page).to have_content(@user_posts[7].title)
    expect(page).to have_content(@user_posts[6].text[0..200]) # Truncated text
    expect(page).to have_content(@user_posts[7].text[0..200]) # Truncated text
    expect(page).to have_content(@user_posts[8].text[0..200]) # Truncated text
  end

  it 'displays the first comments on a post' do
    expect(page).to have_content(@comment1.text)
    expect(page).to have_content(@comment2.text)
    expect(page).to have_content(@comment3.text)
  end

  it 'displays the number of comments and likes a post has' do
    expect(page).to have_content('Comments: 1')
    expect(page).to have_content('Likes: 0')
  end

  it "redirects to a post show page when clicking on a post's see more" do
    click_link 'See More', match: :first
    expect(current_path).to eq(user_post_path(@user, @user_posts[9]))
  end

  it 'displays pagination links' do
    expect(page).to have_selector('.pagination-links')
  end

  it 'displays the correct posts on subsequent pages' do
    # Go to the second page of posts
    visit "#{current_path}?page=2"
    # Ensure posts from 6th to 10th are not displayed on the second page
    (5..9).each do |index|
      expect(page).to_not have_content("Post #{index + 1}")
    end

    # Ensure the 10th post is not displayed on the third page
    expect(page).not_to have_content('Post 10')
  end
end
