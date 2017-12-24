FactoryGirl.define do
  factory :page do
    title "MyString"
    description "MyString"
    published false
    in_menu false
    trait :invalid do
      title nil
    end
  end
end
