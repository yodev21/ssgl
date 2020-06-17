require 'rails_helper'

RSpec.describe 'Users', type: :system do
  wait = Selenium::WebDriver::Wait.new(:timeout => 100) 

  describe "サインイン機能" do
    before do
      @user = FactoryBot.create(:user)
    end
    
    example "ゲストユーザーとしてサインインできること(サインイン画面)" do
      visit new_user_session_path
      click_link "ゲストアカウントでログイン"
      wait.until{ expect(page).to have_content "ゲストユーザーとしてログインしました。" }
    end

    example "ゲストユーザーとしてサインインできること(サインアップ画面)" do
      visit new_user_registration_path
      click_link "ゲストアカウントでログイン"
      wait.until{ expect(page).to have_content "ゲストユーザーとしてログインしました。" }
    end

    example "正常な入力であればサインインできること" do
      visit new_user_session_path
      fill_in "user_email", with: "test@example.com"
      fill_in "user_password", with: "testtest"
      click_button "サインイン"
      wait.until{ expect(page).to have_content "ログインしました。" }
    end

    example "不正な入力であればサインインできないこと" do
      visit new_user_session_path
      fill_in "user_email", with: ""
      fill_in "user_password", with: ""
      click_button "サインイン"
      wait.until{ expect(page).to have_content "メールアドレス もしくはパスワードが不正です。" }
    end

  end

  describe "サインアップ機能" do
    example "正常な情報であればサインアップできること" do
      visit new_user_registration_path
      fill_in "user_name", with: "テスト ユーザー"
      fill_in "user_email", with: "testnew@example.com"
      fill_in "user_password", with: "testtest"
      fill_in "user_password_confirmation", with: "testtest"
      click_button "サインアップ"
      wait.until{ expect(page).to have_content "アカウント登録が完了しました。" }
    end

    example "不正な情報であればサインアップできること" do
      visit new_user_registration_path
      fill_in "user_name", with: "テスト ユーザー"
      fill_in "user_email", with: ""
      fill_in "user_password", with: ""
      fill_in "user_password_confirmation", with: ""
      click_button "サインアップ"
      wait.until{ expect(page).to have_content "サインアップ" }
    end
  end

  describe "ユーザー情報機能" do
    before do
      @user = FactoryBot.create(:user)
    end

    example "情報の更新ができること" do
      visit new_user_session_path
      fill_in "user_email", with: "test@example.com"
      fill_in "user_password", with: "testtest"
      click_button "サインイン"
      click_link "プロフィール"
      click_link "プロフィール編集"
      fill_in "user_name", with: "テストユーザー アップデート"
      click_button "更新"
      wait.until{ expect(page).to have_content "テストユーザー アップデート" }
    end
  end
end