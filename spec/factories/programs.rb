FactoryGirl.define do
  factory :program do
    title "Title"
    description "Description"
    published false
    backgroundcolor "#ee0000"
    backgroundimage "File"
    image "File"
    backgroundimage_credit "Maxi (cc-by-sa)"
    image_credit "Maxi (cc-by-sa)"
    textcolor1 "#cc0000"
    textcolor2 "#dd0000"
    current false
    trait :invalid do
      title nil
    end
    trait :current do
      current true
    end
  end
end
