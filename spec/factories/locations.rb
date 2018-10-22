FactoryBot.define do
  factory :location do
    title { "MyString" }
    address { "MyString" }
    zipcode { "MyString" }
    city { "MyString" }
    email { "MyString" }
    web { "MyString" }
    twitter { "MyString" }
    lat { "MyString" }
    lon { "MyString" }
    shortext { "MyText" }
    longtext { "MyText" }
    trait :invalid do
      title { nil }
    end
  end

end
