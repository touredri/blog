# frozen_string_literal: true

require 'rails_helper'

describe Like, type: :model do
  @user = User.new(name: 'Sam', photo: 'photo.url', bio: 'Excellent')
  @post = Post.new(author: @user, title: 'Let us go', text: 'This is the text for the post')

  subject { Like.create(post: @post, author: @user) }

  before { subject.save }

  it 'should have an author' do
    subject.author = nil
    expect(subject).to_not be_valid
  end

  it 'should have a post' do
    subject.post = nil
    expect(subject).to_not be_valid
  end

  it 'should update the comments_counter' do
    new_user = User.create(name: 'John', photo: 'photo_url', bio: 'Professor', posts_counter: 0)
    new_post = Post.create(author: new_user, title: 'Choose', text: 'text for the post',
                           comments_counter: 0, likes_counter: 0)
    Like.create(post: new_post, author: new_user)
    expect(new_post.likes_counter).to eq(1)
  end
end
