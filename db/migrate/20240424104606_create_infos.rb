# frozen_string_literal: true

class CreateInfos < ActiveRecord::Migration[7.0]
  def change
    create_table :infos do |t|
      t.text :title
      t.text :body

      t.timestamps
    end
  end
end
