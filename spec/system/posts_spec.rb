# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Posts', type: :system do
  describe '新規投稿処理' do
    before do
      # ログイン情報
      User.create!(username: 'test', email: 'test@example.com', password: 'password')

      # カテゴリー
      ['HIPHOP', 'ROCK', 'METAL', 'EDM'].each_with_index do |name|
        Category.create!(name: name)
      end

      # Log in
      visit new_user_session_path
      fill_in 'メール', with: 'test@example.com'
      fill_in 'パスワード', with: 'password'
      click_button 'ログイン'
    end

    context '新規投稿に成功した場合' do
      it '新規投稿成功後の遷移先が正しい' do
        visit new_post_path
        fill_in 'タイトル', with: 'test'
        select "HIPHOP", from: 'post_category_id'
        fill_in '文章', with: 'test'
        fill_in 'タグ', with: '#test'
        click_button '投稿する'
        expect(page).to have_content '投稿しました'
      end
    end

    context '新規投稿に失敗した場合' do
      it '投稿情報に誤りがあることを知らせる' do
        visit new_post_path
        fill_in 'タイトル', with: ''
        select "HIPHOP", from: 'post_category_id'
        fill_in '文章', with: ''
        fill_in 'タグ', with: '#test'
        click_button '投稿する'
        expect(page).to have_content 'タイトルを入力してください'
        expect(page).to have_content '文章を入力してください'
      end
    end
  end
end
