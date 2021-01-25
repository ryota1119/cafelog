FactoryBot.define do
  factory :user do
    nickname                {"testuser"}
    sequence(:email)        {|n| "testeruser#{n}@example.com"}
    password                {"test-password"}
    password_confirmation   {"test-password"}
  end
end
