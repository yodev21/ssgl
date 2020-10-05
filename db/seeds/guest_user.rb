# frozen_string_literal: true

p '-------------------------- Create Strart ----------------------------'
langs = ['Ruby', 'Python', 'Go', 'C++', 'VB.NET', 'C#', 'React', 'Vue', 'JavaScript', 'HTML/CSS', 'jQuery']

# ゲストユーザー作成
p 'Create Guest User'
@guest_user = User.create(
  email: 'guest@example.com',
  name: 'ゲスト ユーザー',
  image: open("#{Rails.root}/app/assets/images/users/1.png"),
  password: 'testtest',
  profile: "プログラミングの学習を始めて１ヶ月目です！\n
            早く一人前のエンジニアになれるように頑張ります！",
  created_at: "2020/06/30 00:00:00",
  updated_at: "2020/06/30 00:00:00"
)
p 'Guest User Success'

# ゲストチーム作成
p 'Create Guest Team'
@guest_team = Team.create!(
  name: 'Ruby on Railsを中心に学習します！【テストデータ/ゲスト】',
  image: open("#{Rails.root}/app/assets/images/teams/1.png"),
  remarks: "#{langs[0]} をメインにサポートしています！ \n
            初心者大歓迎です。!! \n
            楽しくプログラミングをしましょう！！",
  user_id: @guest_user.id,
  created_at: "2020/06/30 00:00:00",
  updated_at: "2020/06/30 00:00:00"
)
p 'Guest Team Success'

# ゲストアサイン作成
p 'Create Guest Assign'
@guest_assign = Assign.create!(
  status: :admin,
  user_id: @guest_user.id,
  team_id: @guest_team.id,
  created_at: "2020/06/30 00:00:00",
  updated_at: "2020/06/30 00:00:00"
)
p 'Guest Assign Success'

# ゲストコース作成
p 'Create Guest Course'
@guest_course = Course.create!(
  title: '初心者向け! Webアプリケーション学習【テスト】',
  content: "タスクの書籍・学習サービスを購入して学習してください。。\n
            タスクが完了しましたらこちらにお知らせください。",
  image: open("#{Rails.root}/app/assets/images/courses/1.png"),
  user_id: @guest_user.id,
  team_id: @guest_team.id,
  assign_id: @guest_assign.id,
  status: :release,
  created_at: "2020/06/30 00:00:00",
  updated_at: "2020/06/30 00:00:00"
)
p 'Create Guest Course2'
@guest_course_2 = Course.create!(
  title: '中級者向け! Ruby on Rails 学習【テスト】',
  content: "タスクの書籍・学習サービスを購入して学習してください。\n
            タスクが完了しましたらこちらにお知らせください。",
  image: open("#{Rails.root}/app/assets/images/courses/1.png"),
  user_id: @guest_user.id,
  team_id: @guest_team.id,
  assign_id: @guest_assign.id,
  status: :release,
  created_at: "2020/06/30 00:00:00",
  updated_at: "2020/06/30 00:00:00"
)
p '-------------------------- 初学者向けコース -----------------------------'
# ゲストコース参加
p 'Create Guest ChallengeCourse'
@guest_challenge_course = ChallengeCourse.create!(
  status: 1,
  user_id: @guest_user.id,
  team_id: @guest_team.id,
  assign_id: @guest_assign.id,
  course_id: @guest_course.id,
  created_at: "2020/06/30 00:00:00",
  updated_at: "2020/06/30 00:00:00"
)
p 'Guest Course Success'
# ゲストタスク作成
p 'Create Guest Task'
@guest_task_1 = Task.create!(
  title: 'Progate',
  content: "Progateに登録してWeb開発パス(Ruby on Rails)のコースをチャレンジしてください。\n
            https://prog-8.com/paths/rails \n
            完了しましたらこちらにお知らせください。",
  image: open("#{Rails.root}/app/assets/images/tasks/progate.png"),
  user_id: @guest_user.id,
  team_id: @guest_team.id,
  assign_id: @guest_assign.id,
  course_id: @guest_course.id,
  priority_no: 1,
  challenge_course_id: @guest_challenge_course.id,
  created_at: "2020/06/30 00:00:00",
  updated_at: "2020/06/30 00:00:00"
)
@guest_task_2 = Task.create!(
  title: 'Git',
  content: "Udemyに登録してGit: もう怖くないGit! チーム開発で必要なGitを完全マスターにチャレンジしてください\n
            https://www.udemy.com/course/unscared_git/ \n
            完了しましたらこちらにお知らせください。",
  image: open("#{Rails.root}/app/assets/images/tasks/git.png"),
  user_id: @guest_user.id,
  team_id: @guest_team.id,
  assign_id: @guest_assign.id,
  course_id: @guest_course.id,
  priority_no: 2,
  challenge_course_id: @guest_challenge_course.id,
  created_at: "2020/06/30 00:00:00",
  updated_at: "2020/06/30 00:00:00"
)
@guest_task_3 = Task.create!(
  title: 'Ruby',
  content: "プロを目指す人Ruby入門にチャレンジしてください\n
            完了しましたらこちらにお知らせください。",
  image: open("#{Rails.root}/app/assets/images/tasks/ruby.png"),
  user_id: @guest_user.id,
  team_id: @guest_team.id,
  assign_id: @guest_assign.id,
  course_id: @guest_course.id,
  priority_no: 3,
  challenge_course_id: @guest_challenge_course.id,
  created_at: "2020/06/30 00:00:00",
  updated_at: "2020/06/30 00:00:00"
)
@guest_task_4 = Task.create!(
  title: 'Ruby on Rails',
  content: "Ruby on Rails 5 速習実践ガイドにチャレンジしてください。\n
            完了しましたらこちらにお知らせください。",
  image: open("#{Rails.root}/app/assets/images/tasks/rails.png"),
  user_id: @guest_user.id,
  team_id: @guest_team.id,
  assign_id: @guest_assign.id,
  course_id: @guest_course.id,
  priority_no: 4,
  challenge_course_id: @guest_challenge_course.id,
  created_at: "2020/06/30 00:00:00",
  updated_at: "2020/06/30 00:00:00"
)
@guest_task_5 = Task.create!(
  title: 'Ruby on Rails 開発',
  content: "インスタグラムのクローンアプリ開発にチャレンジしてください。\n
            完了しましたらこちらにお知らせください。",
  image: open("#{Rails.root}/app/assets/images/tasks/insta.png"),
  user_id: @guest_user.id,
  team_id: @guest_team.id,
  assign_id: @guest_assign.id,
  course_id: @guest_course.id,
  priority_no: 5,
  challenge_course_id: @guest_challenge_course.id,
  created_at: "2020/06/30 00:00:00",
  updated_at: "2020/06/30 00:00:00"
)
@guest_task_6 = Task.create!(
  title: 'SQL',
  content: "スッキリわかるSQL入門 ドリル215門付き! スッキリわかるシリーズにチャレンジしてください。\n
            完了しましたらこちらにお知らせください。",
  image: open("#{Rails.root}/app/assets/images/tasks/sukkiri_sql.png"),
  user_id: @guest_user.id,
  team_id: @guest_team.id,
  assign_id: @guest_assign.id,
  course_id: @guest_course.id,
  priority_no: 6,
  challenge_course_id: @guest_challenge_course.id,
  created_at: "2020/06/30 00:00:00",
  updated_at: "2020/06/30 00:00:00"
)
@guest_task_7 = Task.create!(
  title: 'AWS',
  content: "AWS: ゼロから実践するAmazon Web Services。手を動かしながらインフラの基礎を習得にチャレンジしてください。\n
            完了しましたらこちらにお知らせください。",
  image: open("#{Rails.root}/app/assets/images/tasks/aws.png"),
  user_id: @guest_user.id,
  team_id: @guest_team.id,
  assign_id: @guest_assign.id,
  course_id: @guest_course.id,
  priority_no: 7,
  challenge_course_id: @guest_challenge_course.id,
  created_at: "2020/06/30 00:00:00",
  updated_at: "2020/06/30 00:00:00"
)
p 'Guest Task Success'
p '-------------------------- 初学者向けコース作成完了 ---------------------'
p '-------------------------- 中級者向けコース ----------------------------'
#ゲストコース参加
p 'Create Guest ChallengeCourse'
@guest_challenge_course_2 = ChallengeCourse.create!(
  status: 1,
  user_id: @guest_user.id,
  team_id: @guest_team.id,
  assign_id: @guest_assign.id,
  course_id: @guest_course_2.id,
  created_at: "2020/06/30 00:00:00",
  updated_at: "2020/06/30 00:00:00"
)
p 'Guest Course Success'
# ゲストタスク作成
p 'Create Guest Task'
@guest_task2_1 = Task.create!(
  title: 'パーフェクトRuby on Rails',
  content: "パーフェクトRuby on Railsにチャレンジしてください。\n完了しましたらこちらにお知らせください。",
  image: open("#{Rails.root}/app/assets/images/tasks/perfect_rails.png"),
  user_id: @guest_user.id,
  team_id: @guest_team.id,
  assign_id: @guest_assign.id,
  course_id: @guest_course_2.id,
  priority_no: 1,
  challenge_course_id: @guest_challenge_course_2.id,
  created_at: "2020/06/30 00:00:00",
  updated_at: "2020/06/30 00:00:00"
)
p 'Create Guest Task'
@guest_task2_2 = Task.create!(
  title: 'Ruby on Rails6 実践ガイド',
  content: "Ruby on Rails実践ガイドにチャレンジしてください。\n完了しましたらこちらにお知らせください。",
  image: open("#{Rails.root}/app/assets/images/tasks/practice_rails_1.png"),
  user_id: @guest_user.id,
  team_id: @guest_team.id,
  assign_id: @guest_assign.id,
  course_id: @guest_course_2.id,
  priority_no: 2,
  challenge_course_id: @guest_challenge_course_2.id,
  created_at: "2020/06/30 00:00:00",
  updated_at: "2020/06/30 00:00:00"
)
p 'Create Guest Task'
@guest_task2_3 = Task.create!(
  title: 'Ruby on Rails6 実践ガイド[機能拡張編]',
  content: "Ruby on Rails実践ガイド[機能拡張編]にチャレンジしてください。\n完了しましたらこちらにお知らせください。",
  image: open("#{Rails.root}/app/assets/images/tasks/practice_rails_2.png"),
  user_id: @guest_user.id,
  team_id: @guest_team.id,
  assign_id: @guest_assign.id,
  course_id: @guest_course_2.id,
  priority_no: 3,
  challenge_course_id: @guest_challenge_course_2.id,
  created_at: "2020/06/30 00:00:00",
  updated_at: "2020/06/30 00:00:00"
)
p 'Create Guest Task'
@guest_task2_4 = Task.create!(
  title: 'オブジェクト指向設計実践ガイド',
  content: "オブジェクト指向設計実践ガイドにチャレンジしてください。\n完了しましたらこちらにお知らせください。",
  image: open("#{Rails.root}/app/assets/images/tasks/object_ruby.png"),
  user_id: @guest_user.id,
  team_id: @guest_team.id,
  assign_id: @guest_assign.id,
  course_id: @guest_course_2.id,
  priority_no: 4,
  challenge_course_id: @guest_challenge_course_2.id,
  created_at: "2020/06/30 00:00:00",
  updated_at: "2020/06/30 00:00:00"
)
p 'Create Guest Task'
@guest_task2_5 = Task.create!(
  title: '達人に学ぶSQL徹底指南書',
  content: "達人に学ぶSQL徹底指南書にチャレンジしてください。\n完了しましたらこちらにお知らせください。",
  image: open("#{Rails.root}/app/assets/images/tasks/codezine_sql.png"),
  user_id: @guest_user.id,
  team_id: @guest_team.id,
  assign_id: @guest_assign.id,
  course_id: @guest_course_2.id,
  priority_no: 5,
  challenge_course_id: @guest_challenge_course_2.id,
  created_at: "2020/06/30 00:00:00",
  updated_at: "2020/06/30 00:00:00"
)
p 'Create Guest Task'
@guest_task2_6 = Task.create!(
  title: '「Auth0」で作る!認証付きシングルページアプリケーション',
  content: "「Auth0」で作る!認証付きシングルページアプリケーションにチャレンジしてください。\n完了しましたらこちらにお知らせください。",
  image: open("#{Rails.root}/app/assets/images/tasks/auth0_rails_nuxt.png"),
  user_id: @guest_user.id,
  team_id: @guest_team.id,
  assign_id: @guest_assign.id,
  course_id: @guest_course_2.id,
  priority_no: 6,
  challenge_course_id: @guest_challenge_course_2.id,
  created_at: "2020/06/30 00:00:00",
  updated_at: "2020/06/30 00:00:00"
)
p '-------------------------- 中級者向けコース作成完了 ---------------------'

10.times do |n|
  # ユーザー作成
  p "Create test User#{n}"
  @user = User.create!(
    email: "test#{n}@example.com",
    password: 'testtest',
    name: "テスト ユーザー#{n}",
    profile: "プログラミングの学習を始めて１ヶ月目です！\n
              早く一人前のエンジニアになれるように頑張ります！",
    image: open("#{Rails.root}/app/assets/images/users/#{n}.png"),
  created_at: "2020/06/30 00:00:00",
  updated_at: "2020/06/30 00:00:00"
  )
  p "test User#{n} Success"

  # ゲストチームアサイン
  p "Create test Assign#{n}"
  @assign = Assign.create!(
    status: :member,
    user_id: @user.id,
    team_id: @guest_team.id,
    created_at: "2020/06/30 00:00:00",
    updated_at: "2020/06/30 00:00:00"
  )
  p "test Assign#{n} Success"

  # チャレンジコース作成
  @ChallengeCourse = ChallengeCourse.create!(
    status: 1,
    user_id: @user.id,
    team_id: @guest_team.id,
    assign_id: @guest_assign.id,
    course_id: @guest_course.id,
    created_at: "2020/06/30 00:00:00",
    updated_at: "2020/06/30 00:00:00"
  )

  # チャレンジタスク作成
  p "Create test ChallengeStart#{n}"
  
  @ChallengeStart = ChallengeStart.create!(
    status: :underway,
    user_id: @user.id,
    team_id: @guest_team.id,
    assign_id: @guest_assign.id,
    course_id: @guest_course.id,
    challenge_course_id: @guest_challenge_course.id,
    task_id: @guest_task_1.id,
    created_at: "2020/06/30 00:00:00",
    updated_at: "2020/06/30 00:00:00"
  )

  p "test Team#{n} Success"
end

p '-------------------------- complete ---------------------------------'