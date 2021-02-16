FactoryBot.define do
  factory :comment do
    text { "MyText" }
    shop { nil }
    user { nil }
  end
end
