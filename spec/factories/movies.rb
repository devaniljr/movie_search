FactoryBot.define do
  factory :movie do
    title { Faker::Movie.title }
  end
end
