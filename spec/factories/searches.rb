FactoryBot.define do
  factory :search do
    title { Faker::Movie.title }
    movie
  end
end
