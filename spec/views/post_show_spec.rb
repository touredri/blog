# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Post Show Page', type: :feature do
  before do
    # Create a user with a post and comments to test the view
    @user = User.create(name: 'John Doe', photo: 'profile_url', bio: 'I am a user.')
    @post = @user.posts.create(title: 'Post 1', text: 'This is post 1.')
    @comment1 = @post.comments.create(text: 'Comment 1', author: @user)
    @comment2 = @post.comments.create(text: 'Comment 2', author: @user)
    visit user_post_path(@user, @post)
  end

  it 'displays the post title' do
    expect(page).to have_content(@post.title)
  end

  it 'displays who wrote the post' do
    expect(page).to have_content(@user.name)
  end

  it 'displays the number of comments and likes the post has' do
    expect(page).to have_content('Comments:2')
    expect(page).to have_content('Likes:0')
  end

  it 'displays the post body' do
    expect(page).to have_content(@post.text)
  end

  it 'displays the username of each commenter' do
    expect(page).to have_content(@comment1.author.name)
    expect(page).to have_content(@comment2.author.name)
  end

  it 'displays the comment left by each commenter' do
    expect(page).to have_content(@comment1.text)
    expect(page).to have_content(@comment2.text)
  end
end
