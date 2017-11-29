FactoryBot.define do
  factory :document do
    sequence(:filename) {|n| "document#{n}"}
    description "doc. description"
    latitude "100"
    longitude "100"
    attachment { File.new("#{Rails.root}/spec/files/test.txt") }
    association :user
    association :book
  end
end
