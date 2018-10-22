FactoryBot.define do

  sequence :login do |login|
    "#{Faker::Internet.user_name}#{login}".gsub(/[^a-z0-9]/, "-")
  end

  factory :user do |u|
    u.firstname {Faker::Name.first_name}
    u.lastname  {Faker::Name.last_name}
    u.email { Faker::Internet.email }
    u.login     {generate :login}
    u.last_sign_in_at     { 1.week.ago }
    u.current_sign_in_at  { 1.week.ago }
    u.password { 'abcdefg' }
    u.password_confirmation {|x| x.password}
  end

  factory :role do |r|
  end
end

# users with role
def define_user_with_role(role)
  FactoryBot.define do

    factory :"user_with_#{role}_role", :parent => :user do |u|
      u.login { generate :login }
      # u.login "huibuh"
      u.roles {[ build(:role, :name => role) ]} # lazy evaluation with {}
    end
  end
end

%w(admin user wsx).each { |role| define_user_with_role(role) }


