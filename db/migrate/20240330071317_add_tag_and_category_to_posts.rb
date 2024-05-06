# frozen_string_literal: true

class AddTagAndCategoryToPosts < ActiveRecord::Migration[7.0]
  def change
    add_reference :posts, :tag, null: false, foreign_key: true
    add_reference :posts, :category, null: false, foreign_key: true
  end
end
