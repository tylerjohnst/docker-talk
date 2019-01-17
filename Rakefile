task :worker do
  exec 'bundle exec sidekiq -c 10 -r ./worker.rb'
end

task :web do
  exec 'bundle install && bundle exec rackup -p 80 -o 0.0.0.0'
end

task :console do
  exec 'irb -r./web.rb'
end
