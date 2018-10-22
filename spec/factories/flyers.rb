FactoryBot.define do
  factory :flyer do
    image { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec', 'support', 'flyer.jpg'), 'image/jpg') }
    title { "MyString" }
    trait :invalid do
      image { nil }
    end
  end
end
