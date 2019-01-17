require './web'
require 'sidekiq/web'

Sidekiq::Web.set :sessions, false

map '/' do
  run Sinatra::Application
end

map '/sidekiq' do
  use Rack::Session::Cookie, secret: 'dont-hack-me'

  run Sidekiq::Web
end
