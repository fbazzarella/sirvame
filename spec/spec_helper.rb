require 'capybara/rspec'

ENV["RAILS_ENV"] ||= "test"
require File.expand_path("../../config/environment", __FILE__)
require "rspec/rails"

RSpec.configure do |config|
  config.use_transactional_fixtures = false
  config.mock_with :rspec
  config.before(:suite) { DatabaseCleaner.strategy = :truncation }
  config.before(:each) { DatabaseCleaner.start }
  config.after(:each) { DatabaseCleaner.clean }
end

ActiveSupport::Dependencies.clear
Dir[Rails.root.join("spec/support/**/*.rb")].each {|f| require f}