class ChangeColumnNameInPost < ActiveRecord::Migration[7.0]
  def change
    rename_column :posts, :comments_count, :comments_counter
    rename_column :posts, :likes_count, :likes_counter
  end
end
