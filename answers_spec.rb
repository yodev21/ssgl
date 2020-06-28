# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Answers', type: :system do
  describe '回答機能' do
    before do
      @user = FactoryBot.create(:user, email: 'testAnswerSystem@example.com')
      @other = FactoryBot.create(:user, email: 'testAnswerSystemOther@example.com')
      @user_team = FactoryBot.create(:team, name: 'Other Team', user_id: @other.id)
      @other_team = FactoryBot.create(:team, name: 'My Team', user_id: @user.id)
      @user_assign = FactoryBot.create(:assign, user_id: @user.id, team_id: @other_team.id)
      FactoryBot.create(:challenge_start)
      visit new_user_session_path
      fill_in 'user_email', with: 'testAnswerSystem@example.com'
      fill_in 'user_password', with: 'testtest'
      click_button 'サインイン'
    end
    example '正常な入力な場合登録されること' do
      click_link 'チーム'
    end
  end
end
