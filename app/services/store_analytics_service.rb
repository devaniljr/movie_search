class StoreAnalyticsService < ApplicationService
    attr_reader :search, :redis

    def initialize(search)
        @search = search
        @redis = Redis.new
    end

    def call
        time = Time.parse(search['time'])
        month_key = "analytics:month:#{time.strftime("%m:%Y")}"
        year_key = "analytics:year:#{time.strftime("%Y")}"

        redis.incr("analytics:totalsearches")
        redis.incr(month_key)
        redis.incr(year_key)
    end
end
