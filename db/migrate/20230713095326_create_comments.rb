class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.references :user, null: false, foreign_key: true, on_delete: :cascade
      t.references :post, null: false, foreign_key: true, on_delete: :cascade
      t.text :text

      t.timestamps
    end
  end
end
