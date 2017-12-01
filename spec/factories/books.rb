FactoryBot.define do
  factory :book do
    sequence(:name) {|n| "MyNameString#{n}"}
    sequence(:key) {|n| "MyKeyString#{n}"}
    description "MyText"
    latitude "MyString"
    longitude "MyString"
  end
end
