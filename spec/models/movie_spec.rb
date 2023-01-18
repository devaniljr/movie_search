require 'rails_helper'

RSpec.describe Movie, type: :model do
  it 'is valid with a title' do
    movie = build(:movie)
    expect(movie).to be_valid
  end

  it 'is invalid without a title' do
    movie = build(:movie, title: nil)
    movie.valid?
    expect(movie.errors[:title]).to include("can't be blank")
  end

  it 'is invalid with a duplicate title' do
    create(:movie, title: 'The Great Gatsby')
    movie = build(:movie, title: 'The Great Gatsby')
    movie.valid?
    expect(movie.errors[:title]).to include("has already been taken")
  end

  it 'is case-insensitive unique' do
    create(:movie, title: 'The Great Gatsby')
    movie = build(:movie, title: 'the great gatsby')
    movie.valid?
    expect(movie.errors[:title]).to include("has already been taken")
  end
end
