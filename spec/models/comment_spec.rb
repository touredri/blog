# frozen_string_literal: true

require 'rails_helper'

describe Comment, type: :model do
  @user = User.new(name: 'Sam', photo: 'photo.url', bio: 'Excellent')
  @post = Post.new(author: @user, title: 'Let us go', text: 'This is the text for the post')

  subject { Comment.create(post: @post, author: @user, text: 'My comment is here') }

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
    Comment.create(post: new_post, author: new_user, text: 'New comment text')
    expect(new_post.comments_counter).to eq(1)
  end
end
