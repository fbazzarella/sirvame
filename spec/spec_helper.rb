ENV["RAILS_ENV"] ||= "test"

require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'
require 'capybara/rspec'

module SpecHelpers
  def simule_page_for_company!
    let(:company) { FactoryGirl.create(:company) }
    let(:fixture) { Rails.root.join('spec/fixtures', 'home.html.erb') }
    let(:to_dir)  { Rails.root.join("app/views/companies/#{company.username}") }

    before { FileUtils.cp(fixture, FileUtils.mkdir_p(to_dir).join) }
    after  { FileUtils.rm_r(to_dir) }
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