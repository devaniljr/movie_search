150.times do
  Movie.create(title: Faker::Movie.unique.title)
end
