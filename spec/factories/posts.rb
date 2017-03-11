FactoryGirl.define do
  factory :post do
    title "MyString"
    shortext "MyText"
    longtext "MyText"
    startdate "2015-03-16 15:13:04"
    enddate "2015-03-16 15:13:04"
    location_id 1
    link "MyString"
    label "MyString"
    organizer "MyString"
    organizerlink "MyString"
    trait :invalid do
      title nil
    end
  end
end
