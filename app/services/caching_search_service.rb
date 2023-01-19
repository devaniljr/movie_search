class CachingSearchService < ApplicationService
  attr_reader :id, :query, :result
  
  def initialize(id, query, result)
    @id = id
    @query = query
    @result = result
  end

  def call
    redis = Redis.new

    redis.hset("search:#{id}", "query", query)
    redis.hset("search:#{id}", "result", result)
    redis.hset("search:#{id}", "time", Time.now.to_s)
  end
end
