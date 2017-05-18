FactoryGirl.define do
  factory :program do
    title "Title"
    description "Description"
    published false
    backgroundcolor "#ee0000"
    backgroundimage "File"
    textcolor1 "#cc0000"
    textcolor2 "#dd0000"
    current = true
    trait :invalid do
      title nil
    end
  end
end
