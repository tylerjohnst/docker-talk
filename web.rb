# frozen_string_literal: true

require('bundler') && Bundler.require

require 'sinatra'
require 'sidekiq'
require 'cowsay'

REDIS_URL = 'redis://redis'

Sidekiq.configure_server do |config|
  config.redis = { url: REDIS_URL }
end

Sidekiq.configure_client do |config|
  config.redis = { url: REDIS_URL }
end

class CowsayWorker
  include Sidekiq::Worker

  def perform(message, *)
    puts Cowsay.say(message, 'cow')
  end
end

get "/" do
  "Hello From Docker!"
end
