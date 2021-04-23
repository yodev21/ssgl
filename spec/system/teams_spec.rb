# frozen_string_literal: true

RSpec.describe 'Teams', type: :system do
  wait = Selenium::WebDriver::Wait.new(timeout: 100)

  describe 'チーム作成機能' do
    before do
      @user = FactoryBot.create(:user, email: 'testUserSystem@example.com')
      @team = FactoryBot.create(:team, name: 'My Team', user_id: @user.id)
      @assign = FactoryBot.create(:assign, user_id: @user.id, team_id: @team.id)
      visit new_user_session_path
      fill_in 'user_email', with: 'testUserSystem@example.com'
      fill_in 'user_password', with: 'testtest'
      click_button 'サインイン'
      click_on 'メンターになって教える'
    end

    example '正常な入力であればチームが作成できること' do
      visit new_mentor_team_path
      fill_in 'team_name', with: 'テスト チーム'
      attach_file 'team_image', "#{Rails.root}/app/assets/images/teams/1.png", make_visible: true
      click_button '登録'
      wait.until { expect(page).to have_content 'チームを作成しました。' }
    end

    example '不正な入力であればチームが作成ができないこと' do
      visit new_mentor_team_path
      fill_in 'team_name', with: ''
      click_button '登録'
      wait.until { expect(page).to have_content 'チーム作成' }
    end
  end

  describe 'チーム編集機能' do
    before do
      @user = FactoryBot.create(:user, email: 'testUserSystemUpdate@example.com')
      @team = FactoryBot.create(:team, name: 'My Team', user_id: @user.id)
      @assign = FactoryBot.create(:assign, user_id: @user.id, team_id: @team.id)
      visit new_user_session_path
      fill_in 'user_email', with: 'testUserSystemUpdate@example.com'
      fill_in 'user_password', with: 'testtest'
      click_button 'サインイン'
      visit new_mentor_team_path
      fill_in 'team_name', with: 'テスト チーム'
      attach_file 'team_image', "#{Rails.root}/app/assets/images/teams/1.png", make_visible: true
      click_button '登録'
    end

    example '情報の更新ができること' do
      visit edit_mentor_team_path(@team)
      fill_in 'team_name', with: 'テスト チーム アップデート'
      attach_file 'team_image', "#{Rails.root}/app/assets/images/teams/1.png", make_visible: true
      click_button '更新'
      wait.until { expect(page).to have_content 'テスト チーム アップデート' }
    end
  end
  describe 'チーム削除機能' do
    before do
      @user = FactoryBot.create(:user, email: 'test1@example.com')
      visit new_user_session_path
      fill_in 'user_email', with: 'test1@example.com'
      fill_in 'user_password', with: 'testtest'
      click_button 'サインイン'
      visit new_mentor_team_path
      fill_in 'team_name', with: 'テスト チーム'
      attach_file 'team_image', "#{Rails.root}/app/assets/images/teams/1.png", make_visible: true
      click_button '登録'
    end
    example 'チーム削除を行った場合削除されること' do
      visit mentor_team_path(@user.teams.first)
      click_on 'チーム削除'
      page.driver.browser.switch_to.alert.accept
      wait.until { expect(page).to have_content 'チームを削除しました。' }
    end
  end
end
