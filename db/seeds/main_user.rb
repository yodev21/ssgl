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

# メインユーザー作成
@main_user = User.create(
  email: 'yodev21@example.com',
  name: '管理者 ユーザー',
  image: open("#{Rails.root}/app/assets/images/users/1.png"),
  password: 'testtest',
  profile: "プログラミングの学習を始めて１ヶ月目です！\n
            早く一人前のエンジニアになれるように頑張ります！",
  created_at: "2020/10/01 00:00:00",
  updated_at: "2020/10/01 00:00:00"
)
p 'Guest User Success'

# ゲストチーム作成
p 'Create Guest Team'
@main_team = Team.create!(
  name: 'Ruby on Railsを中心に学習します！【テストデータ/メイン】',
  image: open("#{Rails.root}/app/assets/images/teams/1.png"),
  remarks: "#{langs[0]} をメインにサポートしています！ \n
            初心者大歓迎です。!! \n
            楽しくプログラミングをしましょう！！",
  user_id: @main_user.id,
  created_at: "2020/07/01 00:00:00",
  updated_at: "2020/07/01 00:00:00"
)
p 'Guest Team Success'

# ゲストアサイン作成
p 'Create Guest Assign'
@main_assign = Assign.create!(
  status: :admin,
  user_id: @main_user.id,
  team_id: @main_team.id,
  created_at: "2020/07/01 00:00:00",
  updated_at: "2020/07/01 00:00:00"
)
p 'Guest Assign Success'

# ゲストコース作成
p 'Create Guest Course'
@main_course = Course.create!(
  title: '初心者向け! Webアプリケーション学習【テスト】',
  content: "タスクの書籍・学習サービスを購入して学習してください。。\n
            タスクが完了しましたらこちらにお知らせください。",
  image: open("#{Rails.root}/app/assets/images/courses/1.png"),
  user_id: @main_user.id,
  team_id: @main_team.id,
  assign_id: @main_assign.id,
  status: :release,
  created_at: "2020/07/01 00:00:00",
  updated_at: "2020/07/01 00:00:00"
)
p 'Create Guest Course2'
@main_course_2 = Course.create!(
  title: '中級者向け! Ruby on Rails 学習【テスト】',
  content: "タスクの書籍・学習サービスを購入して学習してください。\n
            タスクが完了しましたらこちらにお知らせください。",
  image: open("#{Rails.root}/app/assets/images/courses/1.png"),
  user_id: @main_user.id,
  team_id: @main_team.id,
  assign_id: @main_assign.id,
  status: :release,
  created_at: "2020/07/01 00:00:00",
  updated_at: "2020/07/01 00:00:00"
)
p '-------------------------- 初学者向けコース -----------------------------'
# ゲストコース参加
p 'Create Guest ChallengeCourse'
@main_challenge_course = ChallengeCourse.create!(
  status: 1,
  user_id: @main_user.id,
  team_id: @main_team.id,
  assign_id: @main_assign.id,
  course_id: @main_course.id,
  created_at: "2020/07/01 00:00:00",
  updated_at: "2020/07/01 00:00:00"
)
p 'Guest Course Success'
# ゲストタスク作成
p 'Create Guest Task'
@main_task_1 = Task.create!(
  title: 'Progate',
  content: "Progateに登録してWeb開発パス(Ruby on Rails)のコースをチャレンジしてください。\n
            https://prog-8.com/paths/rails \n
            完了しましたらこちらにお知らせください。",
  image: open("#{Rails.root}/app/assets/images/tasks/progate.png"),
  user_id: @main_user.id,
  team_id: @main_team.id,
  assign_id: @main_assign.id,
  course_id: @main_course.id,
  priority_no: 1,
  challenge_course_id: @main_challenge_course.id,
  created_at: "2020/07/01 00:00:00",
  updated_at: "2020/07/01 00:00:00"
)
@main_task_2 = Task.create!(
  title: 'Git',
  content: "Udemyに登録してGit: もう怖くないGit! チーム開発で必要なGitを完全マスターにチャレンジしてください\n
            https://www.udemy.com/course/unscared_git/ \n
            完了しましたらこちらにお知らせください。",
  image: open("#{Rails.root}/app/assets/images/tasks/git.png"),
  user_id: @main_user.id,
  team_id: @main_team.id,
  assign_id: @main_assign.id,
  course_id: @main_course.id,
  priority_no: 2,
  challenge_course_id: @main_challenge_course.id,
  created_at: "2020/07/01 00:00:00",
  updated_at: "2020/07/01 00:00:00"
)
@main_task_3 = Task.create!(
  title: 'Ruby',
  content: "プロを目指す人Ruby入門にチャレンジしてください\n
            完了しましたらこちらにお知らせください。",
  image: open("#{Rails.root}/app/assets/images/tasks/ruby.png"),
  user_id: @main_user.id,
  team_id: @main_team.id,
  assign_id: @main_assign.id,
  course_id: @main_course.id,
  priority_no: 3,
  challenge_course_id: @main_challenge_course.id,
  created_at: "2020/07/01 00:00:00",
  updated_at: "2020/07/01 00:00:00"
)
@main_task_4 = Task.create!(
  title: 'Ruby on Rails',
  content: "Ruby on Rails 5 速習実践ガイドにチャレンジしてください。\n
            完了しましたらこちらにお知らせください。",
  image: open("#{Rails.root}/app/assets/images/tasks/rails.png"),
  user_id: @main_user.id,
  team_id: @main_team.id,
  assign_id: @main_assign.id,
  course_id: @main_course.id,
  priority_no: 4,
  challenge_course_id: @main_challenge_course.id,
  created_at: "2020/07/01 00:00:00",
  updated_at: "2020/07/01 00:00:00"
)
@main_task_5 = Task.create!(
  title: 'Ruby on Rails 開発',
  content: "インスタグラムのクローンアプリ開発にチャレンジしてください。\n
            完了しましたらこちらにお知らせください。",
  image: open("#{Rails.root}/app/assets/images/tasks/insta.png"),
  user_id: @main_user.id,
  team_id: @main_team.id,
  assign_id: @main_assign.id,
  course_id: @main_course.id,
  priority_no: 5,
  challenge_course_id: @main_challenge_course.id,
  created_at: "2020/07/01 00:00:00",
  updated_at: "2020/07/01 00:00:00"
)
@main_task_6 = Task.create!(
  title: 'SQL',
  content: "スッキリわかるSQL入門 ドリル215門付き! スッキリわかるシリーズにチャレンジしてください。\n
            完了しましたらこちらにお知らせください。",
  image: open("#{Rails.root}/app/assets/images/tasks/sukkiri_sql.png"),
  user_id: @main_user.id,
  team_id: @main_team.id,
  assign_id: @main_assign.id,
  course_id: @main_course.id,
  priority_no: 6,
  challenge_course_id: @main_challenge_course.id,
  created_at: "2020/07/01 00:00:00",
  updated_at: "2020/07/01 00:00:00"
)
@main_task_7 = Task.create!(
  title: 'AWS',
  content: "AWS: ゼロから実践するAmazon Web Services。手を動かしながらインフラの基礎を習得にチャレンジしてください。\n
            完了しましたらこちらにお知らせください。",
  image: open("#{Rails.root}/app/assets/images/tasks/aws.png"),
  user_id: @main_user.id,
  team_id: @main_team.id,
  assign_id: @main_assign.id,
  course_id: @main_course.id,
  priority_no: 7,
  challenge_course_id: @main_challenge_course.id,
  created_at: "2020/07/01 00:00:00",
  updated_at: "2020/07/01 00:00:00"
)
p 'Guest Task Success'
p '-------------------------- 初学者向けコース作成完了 ---------------------'
p '-------------------------- 中級者向けコース ----------------------------'
#ゲストコース参加
p 'Create Guest ChallengeCourse'
@main_challenge_course_2 = ChallengeCourse.create!(
  status: 1,
  user_id: @main_user.id,
  team_id: @main_team.id,
  assign_id: @main_assign.id,
  course_id: @main_course_2.id,
  created_at: "2020/07/01 00:00:00",
  updated_at: "2020/07/01 00:00:00"
)
p 'Guest Course Success'
# ゲストタスク作成
p 'Create Guest Task'
@main_task_2_1 = Task.create!(
  title: 'パーフェクトRuby on Rails',
  content: "パーフェクトRuby on Railsにチャレンジしてください。\n完了しましたらこちらにお知らせください。",
  image: open("#{Rails.root}/app/assets/images/tasks/perfect_rails.png"),
  user_id: @main_user.id,
  team_id: @main_team.id,
  assign_id: @main_assign.id,
  course_id: @main_course_2.id,
  priority_no: 1,
  challenge_course_id: @main_challenge_course_2.id,
  created_at: "2020/07/01 00:00:00",
  updated_at: "2020/07/01 00:00:00"
)
p 'Create Guest Task'
@main_task_2_2 = Task.create!(
  title: 'Ruby on Rails6 実践ガイド',
  content: "Ruby on Rails実践ガイドにチャレンジしてください。\n完了しましたらこちらにお知らせください。",
  image: open("#{Rails.root}/app/assets/images/tasks/practice_rails_1.png"),
  user_id: @main_user.id,
  team_id: @main_team.id,
  assign_id: @main_assign.id,
  course_id: @main_course_2.id,
  priority_no: 2,
  challenge_course_id: @main_challenge_course_2.id,
  created_at: "2020/07/01 00:00:00",
  updated_at: "2020/07/01 00:00:00"
)
p 'Create Guest Task'
@main_task_2_3 = Task.create!(
  title: 'Ruby on Rails6 実践ガイド[機能拡張編]',
  content: "Ruby on Rails実践ガイド[機能拡張編]にチャレンジしてください。\n完了しましたらこちらにお知らせください。",
  image: open("#{Rails.root}/app/assets/images/tasks/practice_rails_2.png"),
  user_id: @main_user.id,
  team_id: @main_team.id,
  assign_id: @main_assign.id,
  course_id: @main_course_2.id,
  priority_no: 3,
  challenge_course_id: @main_challenge_course_2.id,
  created_at: "2020/07/01 00:00:00",
  updated_at: "2020/07/01 00:00:00"
)
p 'Create Guest Task'
@main_task_2_4 = Task.create!(
  title: 'オブジェクト指向設計実践ガイド',
  content: "オブジェクト指向設計実践ガイドにチャレンジしてください。\n完了しましたらこちらにお知らせください。",
  image: open("#{Rails.root}/app/assets/images/tasks/object_ruby.png"),
  user_id: @main_user.id,
  team_id: @main_team.id,
  assign_id: @main_assign.id,
  course_id: @main_course_2.id,
  priority_no: 4,
  challenge_course_id: @main_challenge_course_2.id,
  created_at: "2020/07/01 00:00:00",
  updated_at: "2020/07/01 00:00:00"
)
p 'Create Guest Task'
@main_task_2_5 = Task.create!(
  title: '達人に学ぶSQL徹底指南書',
  content: "達人に学ぶSQL徹底指南書にチャレンジしてください。\n完了しましたらこちらにお知らせください。",
  image: open("#{Rails.root}/app/assets/images/tasks/codezine_sql.png"),
  user_id: @main_user.id,
  team_id: @main_team.id,
  assign_id: @main_assign.id,
  course_id: @main_course_2.id,
  priority_no: 5,
  challenge_course_id: @main_challenge_course_2.id,
  created_at: "2020/07/01 00:00:00",
  updated_at: "2020/07/01 00:00:00"
)
p 'Create Guest Task'
@main_task_2_6 = Task.create!(
  title: '「Auth0」で作る!認証付きシングルページアプリケーション',
  content: "「Auth0」で作る!認証付きシングルページアプリケーションにチャレンジしてください。\n完了しましたらこちらにお知らせください。",
  image: open("#{Rails.root}/app/assets/images/tasks/auth0_rails_nuxt.png"),
  user_id: @main_user.id,
  team_id: @main_team.id,
  assign_id: @main_assign.id,
  course_id: @main_course_2.id,
  priority_no: 6,
  challenge_course_id: @main_challenge_course_2.id,
  created_at: "2020/07/01 00:00:00",
  updated_at: "2020/07/01 00:00:00"
)
p '-------------------------- 中級者向けコース作成完了 ---------------------'

10.times do |n|
  # ユーザー作成
  p "Create test User#{n}"
  @user = User.create!(
    email: "test#{n+10}@example.com",
    password: 'testtest',
    name: "テスト ユーザー#{n+10}",
    profile: "プログラミングの学習を始めて１ヶ月目です！\n
              早く一人前のエンジニアになれるように頑張ります！",
    image: open("#{Rails.root}/app/assets/images/users/#{n}.png"),
    created_at: "2020/06/30 00:00:00",
    updated_at: "2020/06/30 00:00:00"
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
    user_id: @main_user.id,
    created_at: "2020/07/01 00:00:00",
    updated_at: "2020/07/01 00:00:00"
  )
  p "test Team#{n} Success"

  # ゲストチームアサイン
  p "Create test Assign#{n}"
  @assign = Assign.create!(
    status: :member,
    user_id: @user.id,
    team_id: @main_team.id,
    created_at: "2020/07/01 00:00:00",
    updated_at: "2020/07/01 00:00:00"
  )  
  @main_assign = Assign.create!(
    status: :mentor,
    user_id: @main_user.id,
    team_id: @team.id,
    created_at: "2020/07/01 00:00:00",
    updated_at: "2020/07/01 00:00:00"
  )
  p "test Assign#{n} Success"

  # チャレンジコース作成
  @ChallengeCourse = ChallengeCourse.create!(
    status: 1,
    user_id: @user.id,
    team_id: @main_team.id,
    assign_id: @main_assign.id,
    course_id: @main_course.id,
    created_at: "2020/07/01 00:00:00",
    updated_at: "2020/07/01 00:00:00"
  )
  # チャレンジタスク作成
  p "Create test ChallengeStart#{n}"
  
  @ChallengeStart = ChallengeStart.create!(
    status: :underway,
    user_id: @user.id,
    team_id: @main_team.id,
    assign_id: @main_assign.id,
    course_id: @main_course.id,
    challenge_course_id: @main_challenge_course.id,
    task_id: @main_task_1.id,
    created_at: "2020/07/01 00:00:00",
    updated_at: "2020/07/01 00:00:00"
  )
  p "test Team#{n} Success"
end

p '-------------------------- complete ---------------------------------'