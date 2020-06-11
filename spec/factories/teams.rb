FactoryBot.define do
  factory :team do
    name { "テストチーム" }
    image { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/images/yay.png')) }
    remarks { "テスト備考"}
    user_id { 1 }
  end
end
