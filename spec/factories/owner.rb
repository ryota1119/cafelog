FactoryBot.define do
  factory :owner do
    name                    {"testowner"}
    sequence(:email)        {|n| "tester#{n}@example.com"}
    password                {"test-password"}
    password_confirmation   {"test-password"}
  end
end