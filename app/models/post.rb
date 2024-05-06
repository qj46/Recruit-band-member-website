# frozen_string_literal: true

class Post < ApplicationRecord
  belongs_to :user
  belongs_to :tag, optional: true
  belongs_to :category, optional: true
  has_many :post_tags
  has_many :tags, through: :post_tags

  before_validation :format_hashtags

  validates :title, presence: true
  validates :body, presence: true

  # NOTE: ransack
  def self.ransackable_attributes(_auth_object = nil)
    %w[title body hashtags created_at]
  end

  # NOTE: ransack
  def self.ransackable_associations(_auth_object = nil)
    %w[category post_tags hashtags tags user]
  end

  def format_hashtags
    self.hashtags = hashtags.split(' ').map { |hashtag| hashtag.length > 1 ? "##{hashtag}" : "##{hashtag}" }.join(' ')
  end
end
