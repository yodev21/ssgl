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

# ゲストタスク作成
p 'Create Guest Task'
@guest_task = Task.create!(
  title: 'Railsチュートリアル',
  content: "Railsチュートリアルをサイトを参考に学習してください。\n
            課題が完了しましたらこちらにお知らせください。",
  image: open("#{Rails.root}/app/assets/images/tasks/1.png"),
  user_id: @guest_user.id,
  team_id: @guest_team.id,
  assign_id: @guest_assign.id,
  created_at: "2020-06-30 00:00:00"
)
p 'Guest Task Success'

# ゲストチャレンジタスク作成
p 'Create test ChallengeStart'
@guest_challengeStart = ChallengeStart.create!(
  status: :underway,
  user_id: @guest_user.id,
  team_id: @guest_team.id,
  assign_id: @guest_assign.id,
  task_id: @guest_task.id,
  created_at: "2020-06-30 00:00:00"
)
p 'Guest Challenge Success'

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
    task_id: @guest_task.id
  )
  p "test Team#{n} Success"
end

p '-------------------------- complete ---------------------------------'
