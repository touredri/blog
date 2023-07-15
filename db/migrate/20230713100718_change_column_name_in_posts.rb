# frozen_string_literal: true

class ChangeColumnNameInPosts < ActiveRecord::Migration[7.0]
  def change
    rename_column :posts, :user_id, :author_id
  end
end
