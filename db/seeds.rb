p "Create Administrators"
User.create(
  email: "admin@example.com",
  name: "administrator",
  admin: true,
  password: "administrator00"
)

p "Create Strart"
10.times do |n|
  # ユーザー作成
  @user = User.create!(
    email: "test#{n}@example.com",
    password: "testtest",
    name: "テスト ユーザー#{n}",
    profile: "プログラミングの学習を始めて１ヶ月目です！\n
              早く一人前のエンジニアになれるように頑張ります！",
    image: open("#{Rails.root}/db/users/#{n}.png")
  )
  p "Create テスト ユーザー#{n} Success"
  
  # チーム作成
  langs = ["Ruby", "Python", "Go", "C++", "VB.NET", "C#", "React", "Vue", "JavaScript", "HTML/CSS", "jQuery"]
  @team = Team.create!(
    name: "テスト チーム#{n}",
    image: open("#{Rails.root}/db/teams/#{n}.png"),
    remarks: "#{langs[n]} をメインに学習しています！ \n
              初心者大歓迎です。!! \n
              楽しくプログラミングをしましょう！！",
    user_id: @user.id
  )
  p "Create テスト チーム#{n} Success"

  # チームアサイン
  assign = Assign.create(

  )
end


