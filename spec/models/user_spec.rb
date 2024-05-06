# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validation' do
    context '使用禁止のアカウント名に該当しない場合' do
      it 'アカウントは有効' do
        user = FactoryBot.build(:user)
        expect(user).to be_valid
      end
    end

    context '使用禁止のアカウント名に該当する場合' do
      it 'アカウントは無効' do
        user = FactoryBot.build(:user, username: 'admin')
        expect(user).to be_invalid

        user.username = 'root'
        expect(user).to be_invalid

        user.username = 'dashboard'
        expect(user).to be_invalid

        user.username = 'analytics'
        expect(user).to be_invalid

        user.username = 'appearance'
        expect(user).to be_invalid

        user.username = 'settings'
        expect(user).to be_invalid

        user.username = 'preferences'
        expect(user).to be_invalid

        user.username = 'calendar'
        expect(user).to be_invalid
      end
    end
  end
end
