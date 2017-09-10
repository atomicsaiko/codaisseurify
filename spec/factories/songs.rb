FactoryGirl.define do
  factory :song do
    name  { Faker::Name.name }
    year  { Faker::Number.between(1980, 2017) }
    genre { Fake::Name.name }
    artist { build(:artist) }
  end
end
