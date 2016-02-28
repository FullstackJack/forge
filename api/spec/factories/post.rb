FactoryGirl.define do
  factory :post, class: Forge::Post do
    title "My First Post"
    body "It was the best of times, it was the worst of times..."
    user
  end
end
