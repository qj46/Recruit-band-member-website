# frozen_string_literal: true

class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :messages, dependent: :destroy
  has_many :entries, dependent: :destroy

  has_one_attached :avatar

  validates :full_name, length: { maximum: 50 }
  validates :body, length: { maximum: 80 }
  validate :valid_username

  
  def valid_username
    restricted_username_list = %(admin root dashboard analytics appearance settings preferences calendar)
    errors.add(:username, 'is restricted') if restricted_username_list.include?(username)
  end
end
