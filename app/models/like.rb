# frozen_string_literal: true

class Like < ApplicationRecord
  belongs_to :user
  belongs_to :post

  after_save :update_like_counter

  private
  def update_like_counter
    post.increment!(:likes_counter)
  end
end
