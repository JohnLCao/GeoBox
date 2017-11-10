FactoryBot.define do
  factory :user do
    sequence(:username) { |n| "user#{n}"}
    email { Faker::Internet.email }
    password "simple"
    password_confirmation "simple"
    user_class "regular"
  end

  factory :admin, class: User do
    username "admin"
    email { Faker::Internet.email }
    password "simple"
    password_confirmation "simple"
    user_class "admin"
  end
end
