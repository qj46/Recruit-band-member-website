# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# テスト用ユーザーを作成
10.times do |n|
  User.create!(
    email: "hoge#{n + 1}@example.com",
    username: "hoge#{n + 1}",
    password: "hoge#{n + 1}#{n + 2}#{n + 3}#{n + 4}"
  )
end

# テスト用の記事を作成
5.times do |_n|
  User.all.find_each do |user|
    user.posts.create!(
      title: 'タイトル',
      body: 'テキストテキストテキスト'
    )
  end
end

# テスト用のカテゴリーを作成
Category.create!(name: 'HIPHOP')
Category.create!(name: 'ROCK')
Category.create!(name: 'METAL')
Category.create!(name: 'EDM')
