FactoryBot.define do
  factory :program do
    title { Faker::Lorem.word }
    description { "Description" }
    backgroundcolor { "#ee0000" }
    backgroundimage { "File" }
    image { "File" }
    backgroundimage_credit { "Maxi (cc-by-sa)" }
    backgroundimage_credit_link { "http://maxi.domain.com" }
    backgroundimage_display { "cover" }
    image_credit { "Mini (cc-by-sa)" }
    image_credit_link { "http://mini.domain.com" }
    textcolor1 { "#cc0000" }
    textcolor2 { "#dd0000" }
    current { false }
    published { false }
    trait :without_credits do
      backgroundimage_credit { nil }
      image_credit { nil }
    end
    trait :invalid do
      title { nil }
    end
    trait :current do
      current { true }
    end
  end
end
