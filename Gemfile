source 'https://rubygems.org'

gem 'rails', '3.2.8'
gem 'sqlite3'

group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'zurb-foundation', '~> 3.1'
  gem 'compass-rails'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer', :platforms => :ruby
  gem 'uglifier', '>= 1.0.3'
end

# Front-end
gem 'jquery-rails'
gem 'ember-rails'

# Spree
gem 'spree', '1.2.0'
gem 'spree_auth_devise', :git => 'git://github.com/spree/spree_auth_devise'

# Testing
group :development, :test do
  gem 'konacha' # Mocha, Chai
end

# Monitoring
group :development do
  gem 'rack-perftools_profiler', :require => 'rack/perftools_profiler'
end
group :production do
  gem 'newrelic_rpm'
end

