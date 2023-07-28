# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :validatable
  has_many :posts, foreign_key: :author_id, dependent: :destroy
  has_many :comments, foreign_key: :author_id, dependent: :destroy
  has_many :likes, foreign_key: :author_id, dependent: :destroy

  validates :name, presence: true, allow_blank: false
  validates :posts_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  # returns the last 3 posts of the current user
  def user_recent_posts
    posts.order(created_at: :desc).limit(3)
  end

  # Take a user as parameter and return the last 3 posts of this user
  # # can be use without instantiate new user object
  # # User.user_posts(user)
  # I added this method below for pleasure of the exercise
  def self.user_recent_posts(user)
    Post.where(author_id: user.id).order(created_at: :desc).limit(3)
  end
end
