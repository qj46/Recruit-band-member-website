# frozen_string_literal: true

class AddTagsToPosts < ActiveRecord::Migration[7.0]
  def change
    add_column :posts, :hashtags, :text
  end
end
