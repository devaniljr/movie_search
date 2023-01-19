require 'rails_helper'

describe StoreSearchService do
    let(:search) { {'result' => "Batman", 'time' => "2023-01-19 06:34:36 -0400" } }
    let(:search_without_result) { {'result' => nil, 'time' => "2023-01-19 06:34:36 -0400" } }

    let(:movie) { create(:movie, id: 1, title: "Batman") }

    it 'creates a search record' do
        service = StoreSearchService.new(search)
        
        expect { service.call }.to change(Search, :count).by(1)
    end

    it 'returns a record with movie associated' do
        service = StoreSearchService.new(search)
        record = service.call

        expect(record).to have_attributes(title: search['result'])
    end

    it 'returns a record without movie associated' do
        service = StoreSearchService.new(search)
        record = service.call

        expect(record.movie).to be_nil
    end
end