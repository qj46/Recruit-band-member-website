# frozen_string_literal: true

class Category < ApplicationRecord
  has_many :posts

  def self.options
    Category.all.collect { |val| [val.name, val.id] }
  end

  def self.search_options
    Category.all.collect { |val| [val.name, val.name] }
  end

  # NOTE: ransack
  def self.ransackable_attributes(_auth_object = nil)
    %w[created_at id name updated_at]
  end
end
