# frozen_string_literal: true

class ChangeForeignKeyConstraintForPosts < ActiveRecord::Migration[7.0]
  def change
    change_column :posts, :tag_id, :integer, null: true
    change_column :posts, :category_id, :integer, null: true
  end
end
