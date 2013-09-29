ENV["RAILS_ENV"] ||= "test"

require File.expand_path('../../config/environment', __FILE__)
require 'rspec/rails'
require 'capybara/rspec'

Dir[File.expand_path('../support/*', __FILE__)].each { |f| require f }

Capybara.javascript_driver = :webkit

RSpec.configure do |config|
  config.include Capybara::DSL
  config.extend ControllerMacros, type: :controller

  config.use_transactional_fixtures = true
  config.color_enabled = true
end
