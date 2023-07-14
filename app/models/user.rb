# frozen_string_literal: true

class User < ApplicationRecord
  has_many :posts, foreign_key: :author_id, dependent: :destroy

  # returns the last 3 posts of the current user
  def user_posts
    posts.order(created_at: :desc).limit(3)
  end

  # Take a user as parameter and return the last 3 posts of this user
  # # can be use without instantiate new user object
  # # User.user_posts(user)
  # I added this method below for pleasure of the exercise
  def self.user_posts(user)
    Post.where(author_id: user.id).order(created_at: :desc).limit(3)
  end
end
