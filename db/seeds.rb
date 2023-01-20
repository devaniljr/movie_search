if Movie.count.zero? 
  150.times do
    Movie.create(title: Faker::Movie.unique.title)
  end
end
Movie.reindex
Search.reindex
