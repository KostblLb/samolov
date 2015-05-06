source 'https://rubygems.org'


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~>4.1.0'

# Mongoid and utils
gem 'mongoid', '~> 4.0.0'
gem 'mongoid-paperclip', require: 'mongoid_paperclip'

gem 'active_model_serializers'
gem 'oj'

gem 'state_machine'

# delayed jobs
gem 'sidekiq'
gem 'sidekiq-client-cli'
gem 'whenever'

# Search engine
gem 'ransack', github: 'Zhomart/ransack', branch: 'mongoid'

# Admin tool
gem 'rails_admin'
gem 'ckeditor'
gem 'rails_admin_nestable'

# Authentication & Authorization
gem 'devise'
gem 'cancancan'

gem 'slim-rails'

# Pagination
gem 'will_paginate', '~> 3.0.6'
gem 'will_paginate_mongoid'

# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'
# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
gem 'jquery-ui-rails'
gem 'jquery-turbolinks'

# Ember js
gem 'ember-rails'
gem 'ember-source', '1.8'
gem 'emblem-rails'
gem 'emblem-source', '~> 0.3.0'
gem 'momentjs-rails'
gem 'ember-validations-rails'
gem 'ember-cli-rails'

gem 'semantic-ui-rails', github: 'max-konin/semantic-ui-rails', branch: 'v1.x'
gem 'therubyracer',  platforms: :ruby # or any other runtime
gem 'less-rails'
gem 'autoprefixer-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'

# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'

  gem 'capybara', '~> 2.3.0'
  gem 'rspec-rails', '~> 3.0.0'
  gem 'rspec-rerun'
  gem 'email_spec'
  gem 'rspec-legacy_formatters'
  gem 'rspec-mocks'
  gem 'factory_girl_rails'
  gem 'database_cleaner', '~> 1.3.0'
  gem 'cucumber-rails', require: false
  gem 'selenium-webdriver'
  gem 'rack'
  gem 'coveralls', require: false
  gem 'simplecov', require: false
  gem 'unicorn_service', require: false
  gem 'nginx-config', require: false
  gem 'email_spec'
  gem 'delorean'
end

group :development do
  gem 'quiet_assets'
  gem 'capistrano'
  gem 'rvm-capistrano', :require => false
  gem 'net-ssh', '~> 2.7.0'
  gem 'capistrano-unicorn', :require => false
  gem 'capistrano-sidekiq'
end

group :production do
  gem 'unicorn', platform: :ruby
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw]

gem 'font-awesome-rails'

gem 'rmagick'