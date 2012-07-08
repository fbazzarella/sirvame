ENV["RAILS_ENV"] ||= "test"

require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'
require 'capybara/rspec'

module SpecHelpers
  def simule_page_for_company!
    let(:company) { FactoryGirl.create(:company) }
    let(:dir)     { Rails.root.join("app/views/companies/#{company.username}") }
    before        { FileUtils.touch(FileUtils.mkdir_p(dir).join + '/home.html.erb') }
    after         { FileUtils.rm_r(dir) }
  end
end

RSpec.configure do |config|
  config.extend SpecHelpers, type: :controller

  config.use_transactional_fixtures = false
  config.before(:suite) { DatabaseCleaner.strategy = :truncation }
  config.before(:each)  { DatabaseCleaner.start }
  config.after(:each)   { DatabaseCleaner.clean }
end

ActiveSupport::Dependencies.clear