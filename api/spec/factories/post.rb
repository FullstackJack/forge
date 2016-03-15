require 'faker'

FactoryGirl.define do
  factory :post, class: Forge::Post do
    title { Faker::Lorem.words(8).join(' ') }
    body { Faker::Lorem.sentence }
    publish_date { Faker::Date.between(30.days.ago, Time.now) }
    association :user
  end
end
