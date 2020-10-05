p 'Create Administrators'
User.create(
  email: 'admin@example.com',
  name: 'administrator',
  image: open("#{Rails.root}/app/assets/images/users/1.png"),
  admin: true,
  password: 'administrator00',
  profile: "プログラミングの学習を始めて１ヶ月目です！\n
            早く一人前のエンジニアになれるように頑張ります！",
  created_at: "2020/10/01 00:00:00",
  updated_at: "2020/10/01 00:00:00"
)
