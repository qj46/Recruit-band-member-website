# frozen_string_literal: true

class Room < ApplicationRecord
  has_many :messages, dependent: :destroy
  has_many :entries, dependent: :destroy


  # 2つの配列から同じroom_idを持つオブジェクトがあるかどうかを確認しハッシュで返す
  # @param current_entries [Array] 比較対象の配列1
  # @param another_entries [Array] 比較対象の配列2
  # @return [Hash] is_roomとroom_idをキーとする値を持つハッシュ
  def self.check_room_ids(current_entries, another_entries)
    is_room = false
    room_id = nil

    current_entries.each do |current|
      another_entries.each do |another|
        next unless current.room_id == another.room_id

        is_room = true
        room_id = current.room_id
        break
      end

      break if is_room
    end

    { is_room: is_room, room_id: room_id }
  end
end
