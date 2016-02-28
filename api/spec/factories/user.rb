FactoryGirl.define do
  factory :user, class: Forge::User do
    email "user@example.com"
    first_name "User"
    last_name "Person"
    password "password"
    password_confirmation "password"
    role :user

    # Devise Confirmable
    #confirmed_at Date.today
  end

  factory :author_user, class: Forge::User do
    email "author@example.com"
    first_name "Author"
    last_name "Person"
    password "password"
    password_confirmation "password"
    role :author
  end

  factory :admin_user, class: Forge::User do
    email "admin@example.com"
    first_name "Admin"
    last_name "Person"
    password "password"
    password_confirmation "password"
    role :admin
  end

end