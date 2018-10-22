FactoryBot.define do
  factory :page do
    title { "MyString" }
    description { "MyString" }
    published { false }
    in_menu { false }
    in_footer { false }
    trait :invalid do
      title { nil }
    end
  end
end
