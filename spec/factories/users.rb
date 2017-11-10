FactoryGirl.define do
  factory :user do
    sequence(:username) { |n| "user#{n}"}
    email { Faker::Internet.email }
    password "simple"
    password_confirmation "simple"
    user_class "regular"

    factory :amdin do
      user_class "amdin"
    end
  end
end
