source 'http://rubygems.org'

gem 'rails', '3.2.7'
gem 'thin'
gem 'exception_notification'
gem 'pg'
gem 'pg_search'
gem 'acts-as-taggable-on'

gem 'colored'
gem 'pry-rails'
gem 'awesome_print'

group :assets do
  gem 'yui-compressor'
  gem 'jquery-rails'
  gem 'jquery-lionbars'
  gem 'fancybox-rails', git: 'https://github.com/sverigemeny/fancybox-rails'
end

group :development, :test do
  gem 'rspec-rails'
end

group :development do
  gem 'quiet_assets'
end

group :test do
  gem 'shoulda-matchers'
  gem 'factory_girl_rails', '3.3.0'
  gem 'capybara'
  gem 'launchy'
  gem 'database_cleaner'
  gem 'simplecov', require: false
end