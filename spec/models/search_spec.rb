require 'rails_helper'

describe Search, type: :model do
    describe 'associations' do
        it 'belongs to a movie' do
          movie = create(:movie)
          search = create(:search, movie: nil)
          search.movie = movie

          expect(search.movie).to be(movie)
        end
    end

    describe '.most_searched' do
      before do
        Search.create(title: 'Batman')
        Search.create(title: 'Batman')
        Search.create(title: 'Superman')
      end

      it 'returns the most searched titles' do
        expect(Search.most_searched).to eq({ "Batman" => 2, "Superman" => 1 })
      end
    end

    describe '.trending' do
      before do
        Search.create(title: 'Batman', created_at: 8.days.ago)
        Search.create(title: 'Batman')
        Search.create(title: 'Superman')
      end

      it 'returns the trending titles within the given range' do
        expect(Search.trending(7)).to eq({ "Batman" => 1, "Superman" => 1 })
      end
    end
end
