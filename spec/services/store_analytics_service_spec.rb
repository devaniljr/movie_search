require 'rails_helper'

RSpec.describe StoreAnalyticsService do
    let(:search) { { "time" => "2023-01-19 06:34:36 -0400" } }
    let!(:redis) { Redis.new }

    before do
        service = StoreAnalyticsService.new(search)
        service.call
    end
    
    it 'increment total searches' do
        expect(redis.get("analytics:totalsearches")).to eq "1"
    end
    
    it 'increment total searches of month' do
        expect(redis.get("analytics:month:01:2023")).to eq "1"
    end
    
    it 'increment total searches of year' do
        expect(redis.get("analytics:year:2023")).to eq "1"
    end
end
