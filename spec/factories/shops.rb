FactoryBot.define do
  factory :shop do
    name                  {"test cafe"}
    postal_code           {"0000000"}
    prefecture            {"福岡県"}
    city                  {"福岡市中央区天神"}
    house_number          {"1−1"}
    building_name         {"cafe building"}
    phone_number          {1234567890}
    association :owner,
      factory: :owner,
      strategy: :build
  end
end
