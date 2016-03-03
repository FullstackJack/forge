require 'faker'

FactoryGirl.define do

  sequence(:email) { |n| "user#{n}@example.com" }

  factory :user, class: Forge::User do
    email { FactoryGirl.generate(:email) }
    first_name "User"
    last_name "Person"
    password "password"
    password_confirmation "password"
    role :user

    # Devise Confirmable
    #confirmed_at Date.today
  end

  factory :author_user, class: Forge::User do
    email { FactoryGirl.generate(:email) }
    first_name "Author"
    last_name "Person"
    password "password"
    password_confirmation "password"
    role :author
  end

  factory :admin_user, class: Forge::User do
    email { FactoryGirl.generate(:email) }
    first_name "Admin"
    last_name "Person"
    password "password"
    password_confirmation "password"
    role :admin
  end

end