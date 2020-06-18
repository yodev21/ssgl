require 'rails_helper'

RSpec.describe 'Teams', type: :system do
  wait = Selenium::WebDriver::Wait.new(:timeout => 100) 

  describe "チーム作成機能" do
    before do
      @user = FactoryBot.create(:user)
      visit new_user_session_path
      fill_in "user_email", with: "test@example.com"
      fill_in "user_password", with: "testtest"
      click_button "サインイン"
    end

    example "正常な入力であればチームが作成できること" do
      visit new_team_path
      fill_in "team_name", with: "テスト チーム"
      click_button "登録"
      wait.until{ expect(page).to have_content "テスト チーム" }
    end

    example "不正な入力であればチームが作成ができないこと" do
      visit new_team_path
      fill_in "team_name", with: ""
      click_button "登録"
      wait.until{ expect(page).to have_content "チーム作成" }
    end

  end

  describe "チーム編集機能" do
    before do
      @user = FactoryBot.create(:user)
      visit new_user_session_path
      fill_in "user_email", with: "test@example.com"
      fill_in "user_password", with: "testtest"
      click_button "サインイン"
      visit new_team_path
      fill_in "team_name", with: "テスト チーム"
      click_button "登録"
    end
    example "情報の更新ができること" do
      click_link "チーム"
      binding.pry
      click_link "sidebarIconToggle"
      click_link "テスト チーム"
      click_link "チーム情報編集"
      fill_in "team_name", with: "テスト チーム アップデート"
      wait.until{ expect(page).to have_content "テスト チーム アップデート" }
    end
  end

end

