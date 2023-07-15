# frozen_string_literal: true

class ChangeColumnNameInUsers < ActiveRecord::Migration[7.0]
  def change
    rename_column :users, :posts_comment, :posts_counter
  end
end
