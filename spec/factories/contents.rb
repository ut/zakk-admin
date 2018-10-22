FactoryBot.define do
  factory :content do
    title { "MyString" }
    text { "MyText" }
    published { false }
    pos { 1 }
    col { 1 }
    page
    trait :invalid do
      pos { nil }
      col { nil }
    end
  end
end
