ENV["RAILS_ENV"] ||= "test"

require 'simplecov'

SimpleCov.start('rails') do
  minimum_coverage 100
end

require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'
require 'capybara/rspec'

Dir[File.join(File.dirname(__FILE__), 'support/**/*')].each { |f| require f }

Capybara.javascript_driver = :webkit

RSpec.configure do |config|
  config.extend ControllerMacros, type: :controller
  config.use_transactional_fixtures = true
end
