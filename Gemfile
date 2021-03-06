source 'https://rubygems.org'

gem 'rails', '~> 3.2.12'

# DB
gem 'sqlite3'
group :production do
  gem 'pg'
end

group :assets do
  gem 'sass-rails' #,   '~> 3.2.3'
  gem 'coffee-rails' #, '~> 3.2.1'
  gem 'zurb-foundation' #, '~> 3.1'
  gem 'compass-rails'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer', :platforms => :ruby
  gem 'uglifier' #, '>= 1.0.3'
end

# Models
gem 'validates_timeliness'
gem 'valid_email'
gem 'state_machine'

# Front-end
gem 'jquery-rails'

# Testing
group :development, :test do
  gem 'konacha' # Mocha, Chai
  gem 'rspec-rails'
  gem 'capybara'
  gem 'capybara-webkit'
  gem 'factory_girl_rails'
  gem 'ffaker'
  gem 'launchy'
  gem 'debugger'

  # Guard (auto-test reloading)
  gem 'guard-rspec'
  gem 'rb-inotify', :require => false # Linux
  gem 'rb-fsevent', :require => false # OS X
end

# Serving
gem 'unicorn'
gem 'sidekiq'

# Monitoring
group :development do
  gem 'rack-perftools_profiler', :require => 'rack/perftools_profiler'
end
group :production do
  gem 'newrelic_rpm'
end

