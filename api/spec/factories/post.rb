require 'faker'

FactoryGirl.define do
  factory :post, class: Forge::Post do
    title { Faker::Lorem.words(8).join(' ') }
    body { Faker::Lorem.sentence }
    association :user
  end
end
