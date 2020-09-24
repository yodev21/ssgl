# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Tasks', type: :system do
  wait = Selenium::WebDriver::Wait.new(timeout: 500)
  describe 'タスク機能' do
    before do
      @user = FactoryBot.create(:user, email: 'testTaskSystem@example.com')
      @team = FactoryBot.create(:team, name: 'My Team', user_id: @user.id)
      @assign = FactoryBot.create(:assign, user_id: @user.id, team_id: @team.id)
      @course = FactoryBot.create(:course, user_id: @user.id, team_id: @team.id, assign_id: @assign.id)
      @challenge_course = FactoryBot.create(:challenge_course, user_id: @user.id, team_id: @team.id, assign_id: @assign.id, course_id: @course.id)
      @task = FactoryBot.create(:task, user_id: @user.id, team_id: @team.id, assign_id: @assign.id, assign_id: @assign.id, course_id: @course.id, challenge_course_id: @challenge_course.id)
      @challenge_start = FactoryBot.create(:challenge_start, user_id: @user.id, team_id: @team.id, assign_id: @assign.id, course_id: @course.id, challenge_course_id: @challenge_course.id, task_id: @task.id)
      visit new_user_session_path
      fill_in 'user_email', with: 'testTaskSystem@example.com'
      fill_in 'user_password', with: 'testtest'
      click_button 'サインイン'
      click_on 'メンターになって教える'
    end

    example 'タスクが登録できること' do
      visit new_mentor_task_path(course_id: @course.id)
      fill_in 'task_title', with: 'test Title'
      attach_file 'task_image', "#{Rails.root}/app/assets/images/tasks/1.png", make_visible: true
      fill_in 'task_content', with: 'test Content'
      click_button '登録'
      wait.until { expect(page).to have_content '課題を作成しました！' }
    end

    example 'タスクが編集できること' do
      visit edit_mentor_task_path(@task)
      fill_in 'task_title', with: 'test Title Upate'
      attach_file 'task_image', "#{Rails.root}/app/assets/images/tasks/1.png", make_visible: true
      fill_in 'task_content', with: 'test Content Update'
      click_button '登録'
      wait.until { expect(page).to have_content 'test Title Upate' }
    end

    example 'タスクが削除できること' do
      visit mentor_task_path(@task)
      click_link 'タスク削除'
      page.driver.browser.switch_to.alert.accept
      wait.until { expect(page).to have_content '削除しました' }
    end

    example 'タスクの検索ができること' do
      visit mentor_task_path(@task)
      click_button '検索'
      wait.until { expect(page).to have_content 'テストユーザー' }
    end

    example '名前でのタスクの絞り込み検索ができること(成功)' do
      visit mentor_task_path(@task)
      
      fill_in 'search_name', with: 'テスト'
      click_button '検索'
      wait.until { expect(page).to have_content 'テストユーザー' }
    end

    example '名前でのタスクの絞り込み検索ができること(失敗)' do
      visit mentor_task_path(@task)
      fill_in 'search_name', with: 'hoge'
      click_button '検索'
      wait.until { expect(page).not_to have_content 'テストユーザー' }
    end
  end
end
