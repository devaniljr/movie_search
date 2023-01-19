require 'rails_helper'

RSpec.describe Search, type: :model do
    describe 'associations' do
        it 'belongs to a movie' do
          movie = create(:movie)
          search = create(:search, movie: nil)
          search.movie = movie

          expect(search.movie).to be(movie)
        end
    end
end
