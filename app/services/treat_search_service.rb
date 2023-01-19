class TreatSearchService < ApplicationService
    attr_reader :redis

    def initialize
        @redis = Redis.new
    end

    def call
        search_keys = redis.keys("search:*")
        return if search_keys.empty?

        search_keys.each do |search_key|
            search = redis.hgetall(search_key)

            if search["result"].empty?
                search["result"] = CallMovieApiService.call(search["query"])
            end

            StoreSearchService.call(search)
            
            redis.del(search_key)
        end
    end
end
