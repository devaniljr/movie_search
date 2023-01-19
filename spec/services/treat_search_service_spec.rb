require 'rails_helper'

describe TreatSearchService do
    let!(:redis) { Redis.new }
    let(:search1) { { 'query' => 'bat', 'result' => 'Batman', 'time' => '2023-02-19 06:34:36 -0400' } }
    let(:search2) { { 'query' => 'ahsbaywabsbf2', 'result' => '', 'time' => '2023-01-19 06:34:36 -0400' } }

    before do
        redis.hmset("search:1", *search1.flatten)
        redis.hmset("search:2", *search2.flatten)
    end

    context 'when there is search: keys' do
        it 'delete all search keys from redis' do
            service = TreatSearchService.new
            service.call

            expect(redis.keys("search:*").size).to eq(0)
        end
    end

    context 'when there is no search: keys' do
        it 'return without doing anything' do
            service = TreatSearchService.new
            service.call

            expect(redis.keys("search:*")).to be_empty
        end
    end
end