# frozen_string_literal: true

p '-------------------------- Create Strart ----------------------------'
langs = ['Ruby', 'Python', 'Go', 'C++', 'VB.NET', 'C#', 'React', 'Vue', 'JavaScript', 'HTML/CSS', 'jQuery']

team_title = ['Rubyを中心に学習します！【テストデータ】',
              'Pythonを利用したデータ整形やスクレイピングをサポートします！【テストデータ】', 
              '【初心者歓迎！】Goを使ったWebサービス開発！【テストデータ】', 
              'C++でゲームを作ってみませんか？【テストデータ】',
              'VB.Netを使用した業務システムの開発サポート【テストデータ】', 
              'C#でゲームを作ってみませんか？【テストデータ】',
              'Reactを使ってモダンなWebアプリを作ろう!【テストデータ】', 
              'Vueを使ってモダンなWebアプリを作ろう!【テストデータ】', 
              'JavaScriptを学んでフロントエンド開発の学習をしませんか？【テストデータ】', 
              'HTML/CSSを使っておしゃれなサイトを作ろう！【テストデータ】', 
              'jQueryを学んでリッチなサイトを作ろう！【テストデータ】']
tasks = []
p 'Create Administrators'
User.create(
  email: 'admin@example.com',
  name: 'administrator',
  image: open("#{Rails.root}/app/assets/images/users/1.png"),
  admin: true,
  password: 'administrator00'
)

# ゲストユーザー作成
p 'Create Guest User'
@guest_user = User.create(
  email: 'guest@example.com',
  name: 'ゲスト ユーザー',
  image: open("#{Rails.root}/app/assets/images/users/1.png"),
  password: 'testtest',
  profile: "プログラミングの学習を始めて１ヶ月目です！\n
            早く一人前のエンジニアになれるように頑張ります！",
  created_at: "2020/06/30 00:00:00"
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
  created_at: "2020-06-30 00:00:00"
)
p 'Guest Team Success'

# ゲストアサイン作成
p 'Create Guest Assign'
@guest_assign = Assign.create!(
  status: :admin,
  user_id: @guest_user.id,
  team_id: @guest_team.id,
  created_at: "2020-06-30 00:00:00"
)
p 'Guest Assign Success'

# ゲストコース作成
p 'Create Guest Course'
@guest_course = Course.create!(
  title: 'Ruby on Rails Webアプリケーション学習【テスト】',
  content: "Railsチュートリアルをサイトを参考に学習してください。\n
            課題が完了しましたらこちらにお知らせください。",
  image: open("#{Rails.root}/app/assets/images/courses/1.png"),
  user_id: @guest_user.id,
  team_id: @guest_team.id,
  assign_id: @guest_assign.id,
  created_at: "2020-06-30 00:00:00"
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
  created_at: "2020-06-30 00:00:00"
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
  created_at: "2020-06-30 00:00:00"
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
  created_at: "2020-06-30 00:00:00"
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
  created_at: "2020-06-30 00:00:00"
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
  created_at: "2020-06-30 00:00:00"
)
@guest_task_6 = Task.create!(
  title: 'SQL',
  content: "スッキリわかるSQL入門 ドリル215門付き! スッキリわかるシリーズにチャレンジしてください。\n
            完了しましたらこちらにお知らせください。",
  image: open("#{Rails.root}/app/assets/images/tasks/1.png"),
  user_id: @guest_user.id,
  team_id: @guest_team.id,
  assign_id: @guest_assign.id,
  course_id: @guest_course.id,
  created_at: "2020-06-30 00:00:00"
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
  created_at: "2020-06-30 00:00:00"
)
p 'Guest Task Success'


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
  created_at: "2020-07-30 00:00:00"
  )
  p "test User#{n} Success"

  # チーム作成
  p "Create test Team#{n}"
  @team = Team.create!(
    name: team_title[n],
    image: open("#{Rails.root}/app/assets/images/teams/#{n}.png"),
    remarks: "#{langs[n]} をメインに学習しています！ \n
              初心者大歓迎です。!! \n
              楽しくプログラミングをしましょう！！",
    user_id: @user.id
  )
  p "test Team#{n} Success"

  # ゲストチームアサイン
  p "Create test Assign#{n}"
  @assign = Assign.create!(
    status: :member,
    user_id: @user.id,
    team_id: @guest_team.id
  )
  p "test Assign#{n} Success"


  # チャレンジタスク作成
  p "Create test ChallengeStart#{n}"
  
  @ChallengeStart = ChallengeStart.create!(
    status: :underway,
    user_id: @user.id,
    team_id: @guest_team.id,
    assign_id: @guest_assign.id,
    course_id: @guest_course.id,
    task_id: @guest_task_1.id
  )

  p "test Team#{n} Success"
end

p '-------------------------- complete ---------------------------------'
