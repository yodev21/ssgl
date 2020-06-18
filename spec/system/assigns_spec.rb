require 'rails_helper'

RSpec.describe 'Assigns', type: :system do
  wait = Selenium::WebDriver::Wait.new(:timeout => 100) 

  describe "チームアサイン機能" do
    before do
      @user = FactoryBot.create(:user, email: "testAssignSystem@example.com")
      @other = FactoryBot.create(:user, email: "testAssignSystemOther@example.com")
      FactoryBot.create(:team, name: "Other Team", user_id: @other.id)
      FactoryBot.create(:team, name: "My Team", user_id: @user.id)
      visit new_user_session_path
      fill_in "user_email", with: "testAssignSystem@example.com"
      fill_in "user_password", with: "testtest"
      click_button "サインイン"
    end
    
    example "メンバーが他のチームに参加できること" do
      click_link "チーム"
      click_link "Other Team"
      click_link "このチームに参加する！"
      wait.until{ expect(page).to have_content "チームに加入しました。" }
    end

    example "チームから退会することができること" do
      click_link "チーム"
      click_link "Other Team"
      click_link "このチームに参加する！"
      click_link "チーム"
      click_link "Other Team"
      click_link "退会する"
      page.driver.browser.switch_to.alert.accept
      wait.until{ expect(page).to have_content "チームから退会しました。" }
    end
  end

end