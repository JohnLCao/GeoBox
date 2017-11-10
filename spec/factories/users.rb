FactoryGirl.define do
  factory :user do
    sequence(:username) { |n| "user#{n}"}
    email { Faker::Internet.email }
    password "simple"
    password_confirmation "simple"
  end
end
