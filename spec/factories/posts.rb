FactoryGirl.define do
  factory :post do
    title "MyString"
    shortext "MyText"
    longtext "MyText"
    startdate "2015-03-16 15:13:04"
    enddate "2015-03-16 15:13:04"
    location_id 1
    location
    link "MyString"
    label "MyString"
    organizer "MyString"
    organizerlink "MyString"
    status 'Draft'
    ptype 0
    trait :invalid do
      title nil
    end
    trait :published do
      status 'Published'
    end
    trait :missing_location do
      location_id nil
    end
    trait :enddate do
      enddate "2015-03-16 16:13:04"
    end
  end
end
