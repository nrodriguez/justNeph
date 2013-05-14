source 'https://rubygems.org'

gem 'rails', '3.2.11'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

gem 'mysql2'
gem 'thin'
gem 'instagram'
gem 'figaro'
gem 'rest-client'
gem 'addressable'
gem 'jquery-rails'
gem 'activeadmin'

#Front End
gem 'sass-rails',   '~> 3.2.3'
gem 'haml'

# Twitter Bootstrap
gem 'bootstrap-sass'
gem 'font-awesome-sass-rails'

#Authentication
gem 'oauth2'
gem 'oauth'

#Merchant API's
gem "cafepress_api", :github => "nrodriguez/cafepress_api"
gem "zazzle_rails"

# Extension for rescue: this adds jobs
gem 'redis'
gem 'redis-namespace', :require => false
gem 'resque', :require => 'resque/server'
gem "resque-scheduler", '~>1.0', :require => 'resque_scheduler' #required redis version >= 1.3
gem 'resque-cleaner'

group :test do
  gem 'factory_girl_rails'
  gem 'database_cleaner'
  gem 'timecop'
end

group :test, :development do
  gem 'rspec-rails'
  gem 'vcr'
  gem 'fakeweb'
  gem 'better_errors'
  gem 'pry'
  gem 'pry-debugger'
  gem 'pry-rails'
end

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'coffee-rails', '~> 3.2.1'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer', :platforms => :ruby

  gem 'uglifier', '>= 1.0.3'
end

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
gem 'debugger'
