# frozen_string_literal: true

class AddNotNullConstraintToCategoriesName < ActiveRecord::Migration[7.0]
  def change
    change_column_null :categories, :name, false
  end
end
