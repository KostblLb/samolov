# Add your own in_progress in files placed in lib/in_progress ending in .rake,
# for example lib/in_progress/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)

Rails.application.load_tasks

if ENV['RAILS_ENV'] == 'test'
  require 'coveralls/rake/task'
  Coveralls::RakeTask.new
  task :test_with_coveralls => [:spec, 'coveralls:push']
end

