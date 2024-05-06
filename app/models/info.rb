# frozen_string_literal: true

class Info < ApplicationRecord
  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      Info.create!(
        title: row['title'],
        body: row['body']
      )
    end
  end

  def created_today?
    created_at.to_date == Date.today
  end
end
