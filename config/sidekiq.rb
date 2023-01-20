Sidekiq.configure_server do |config|
  config.redis = { url: "#{ENV['REDIS_URL']}/#{ENV['REDIS_SIDEKIQ_DB']}" }
end

Sidekiq.configure_client do |config|
  config.redis = { url: "#{ENV['REDIS_URL']}/#{ENV['REDIS_SIDEKIQ_DB']}" }
end
