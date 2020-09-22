FactoryBot.define do
  factory :course do
    title "テストコース"
    content "テストコンテント"
    image Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/fixtures/1.png'))
  end
end
