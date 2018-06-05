require 'simplecov'
SimpleCov.start
require 'spec_helper'
ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
# Prevent database truncation if the environment is production
abort("The Rails environment is running in production mode!") if Rails.env.production?
require 'rspec/rails'
# Add additional requires below this line. Rails is not loaded until this point!
Shoulda::Matchers.configure do |config|
  config.integrate do |with|
    # Choose a test framework:
    with.test_framework :rspec

    # Choose one or more libraries:
    with.library :rails
  end
end

# If you are not using ActiveRecord, you can remove this line.
ActiveRecord::Migration.maintain_test_schema!
RSpec.configure do |config|
  config.include FactoryBot::Syntax::Methods

  config.before(:suite) do
   DatabaseCleaner.strategy = :transaction
   DatabaseCleaner.clean_with(:truncation)
 end

 config.around(:each) do |example|
   DatabaseCleaner.cleaning do
   example.run
   end
 end
  # Remove this line if you're not using ActiveRecord or ActiveRecord fixtures
  config.fixture_path = "#{::Rails.root}/spec/fixtures"


  config.use_transactional_fixtures = true
  config.infer_spec_type_from_file_location!
  config.filter_rails_from_backtrace!
end
