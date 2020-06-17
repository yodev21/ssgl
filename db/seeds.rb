p "Create Administrators"
User.create(
  email: "admin@example.com",
  name: "administrator",
  admin: true,
  password: "administrator00"
)

p "Create Users"
10.times do |n|
  user = User.create(
          email: "test#{n}@example.com",
          password: "testtest",
          name: "テスト ユーザー#{n}",
          profile: "プログラミングの学習を始めて１ヶ月目です！\n
                    早く一人前のエンジニアになれるように頑張ります！",
          image: open("#{Rails.root}/db/users/#{n}.png")
        )
  p user
end


