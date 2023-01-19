require 'rails_helper'

describe CachingSearchService do
  describe "#call" do
    let(:id) { 123 }
    let(:query) { "some query" }
    let(:result) { "some result" }
    let(:redis) { MockRedis.new }
    let(:time) { Time.now.to_s }

    before do
      allow(Redis).to receive(:new).and_return(redis)
    end
  
    it "sets the query, result, and time in Redis" do
      service = CachingSearchService.new(id, query, result)
      service.call

      expect(redis.data).to include("search:#{id}" => { "query" => query, "result" => result, "time" => time.to_s })
    end
  end
end
