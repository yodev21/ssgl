p "-------------------------- Create Strart ----------------------------"

p "Create Administrators"
User.create(
  email: "admin@example.com",
  name: "administrator",
  admin: true,
  password: "administrator00"
)

p "Create Guest User"
User.create(
  email: "guest@example.com",
  name: "ゲストユーザー",
  password: "testtest",
  profile: "プログラミングの学習を始めて１ヶ月目です！\n
            早く一人前のエンジニアになれるように頑張ります！",
)

10.times do |n|
  # ユーザー作成
  p "Create test User#{n}"
  @user = User.create!(
    email: "test#{n}@example.com",
    password: "testtest",
    name: "テスト ユーザー#{n}",
    profile: "プログラミングの学習を始めて１ヶ月目です！\n
              早く一人前のエンジニアになれるように頑張ります！",
    image: open("#{Rails.root}/app/assets/images/users/#{n}.png")
  )
  p "test User#{n} Success"
  
  # チーム作成
  langs = ["Ruby", "Python", "Go", "C++", "VB.NET", "C#", "React", "Vue", "JavaScript", "HTML/CSS", "jQuery"]
  p "Create test Team#{n}"
  @team = Team.create!(
    name: "テスト チーム#{n}",
    image: open("#{Rails.root}/app/assets/images/teams/#{n}.png"),
    remarks: "#{langs[n]} をメインに学習しています！ \n
              初心者大歓迎です。!! \n
              楽しくプログラミングをしましょう！！",
    user_id: @user.id
  )
  p "test Team#{n} Success"

  # チームアサイン
  p "Create test Assign#{n}"
  @assign = Assign.create!(
    status: :admin,
    user_id: @user.id,
    team_id: @team.id
  )
  p "test Assign#{n} Success"

  p "Create test Task#{n}"
  @task = Task.create!(
    title: "テスト タイトル#{n}",
    content: "#{langs[n]}をテストサイトを参考に学習してください。\n
              課題が完了しましたらこちらにお知らせください。",
    image: open("#{Rails.root}/app/assets/images/tasks/#{n}.png"),
    user_id: @user.id,
    team_id: @team.id,
    assign_id: @assign.id
  )
  p "test Team#{n} Success"

  p "Create test ChallengeStart#{n}"
  @ChallengeStart = ChallengeStart.create!(
    status: :underway,
    user_id: @user.id,
    team_id: @team.id,
    assign_id: @assign.id,
    task_id: @task.id
  )
  p "test Team#{n} Success"

end

p "-------------------------- complete ---------------------------------"