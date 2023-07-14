# frozen_string_literal: true

class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  after_create :update_post_counter
  def update_post_counter
    author.increment!(:posts_counter)
  end

  def post_comments
    comments.order(created_at: :desc).limit(5)
  end

  # can be use without instantiate new post object
  def self.post_comments(post)
    Comment.where(post_id: post.id).order(created_at: :desc).limit(5)
  end
end
