class CleanUpCacheJob
  include Sidekiq::Job

  def perform(*args)
    TreatSearchService.call
  end
end
