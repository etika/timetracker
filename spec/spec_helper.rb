# require 'simplecov'
# require 'simplecov-rcov'

# SimpleCov.formatters = [
#   SimpleCov::Formatter::HTMLFormatter,
#   SimpleCov::Formatter::RcovFormatter
# ]

# SimpleCov.start

# This file is copied to spec/ when you run 'rails generate rspec:install'
ENV["RAILS_ENV"] ||= 'test'
require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'
#require 'rspec/autorun'
require 'capybara/rspec'
require 'capybara/rails'
require 'shoulda/matchers'
require "shoulda/matchers/integrations/rspec"
# Requires supporting ruby files with custom matchers and macros, etc,
# in spec/support/ and its subdirectories.
Dir[Rails.root.join("spec/support/**/*.rb")].each {|f| require f}
Capybara.app_host ='http://example.com'

# OmniAuth.config.test_mode = true
RSpec.configure do |config|

  # config.include Devise::TestHelpers, :type => :controller
  config.include RSpec::Rails::RequestExampleGroup, type: :model
  config.include RSpec::Rails::RequestExampleGroup, type: :mailer
  # ## Mock Framework
  #
  # If you prefer to use mocha, flexmock or RR, uncomment the appropriate line:
  #
  # config.mock_with :mocha
  # config.mock_with :flexmock
  # config.mock_with :rr
  #config.warnings = false
  # Remove this line if you're not using ActiveRecord or ActiveRecord fixtures
  #config.fixture_path = "#{::Rails.root}/spec/fixtures"

  # If you're not using ActiveRecord, or you'd prefer not to run each of your
  # examples within a transaction, remove the following line or assign false
  # instead of true.
  #config.use_transactional_fixtures = false

  # If true, the base class of anonymous controllers will be inferred
  # automatically. This will be the default behavior in future versions of
  # rspec-rails.
  #config.infer_base_class_for_anonymous_controllers = false
  #def require_user
   # @request.env["devise.mapping"] = Devise.mappings[:user]
    #@user =     
    #sign_in @user
  #end
  #config.infer_spec_type_from_file_location!
  config.before(:suite) do
    DatabaseCleaner[:active_record].strategy = :transaction
    DatabaseCleaner.clean_with(:truncation)
    DatabaseCleaner.start
    DatabaseCleaner.clean
  end

  config.before(:each) do
    DatabaseCleaner.start
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end

  config.after(:suite) do
    DatabaseCleaner.clean_with(:truncation)
    Apartment::Database.reset
    drop_schemas
  end
  Capybara.app_host = "http://example.com"

end
