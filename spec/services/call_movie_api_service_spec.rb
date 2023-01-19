require 'rails_helper'

RSpec.describe CallMovieApiService, type: :service do
    describe '#call' do
        it 'returns the title of the first movie in the API call' do
            query = 'Star Wars'
            service = described_class.new(query)
            result = service.call

            expect(result).to include('Star Wars')
        end

        it 'create a movie record if find something in the API call' do
            query = 'Star Wars'
            service = described_class.new(query)

            expect { service.call }.to change(Movie, :count).by(1)
        end

        it 'returns the query if do not find any results in API call' do
            query = 'asasa41f4df1d4'
            service = described_class.new(query)
            
            result = service.call

            expect(result).to eq query
        end
    end
end
