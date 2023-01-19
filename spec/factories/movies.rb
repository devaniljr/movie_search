FactoryBot.define do
  factory :movie do
    title { Faker::Movie.unique.title }

    trait :reindex do
      after(:create) do |movie, _evaluator|
        movie.reindex(refresh: true)
      end
    end
  end
end
