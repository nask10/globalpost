ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'rails/test_help'

# require 'mongoid'
# require 'mongoid-minitest'

# require 'minitest/spec'
require 'factory_bot'
require 'database_cleaner'

DatabaseCleaner.strategy = :truncation

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  # fixtures :all
  # include Devise::TestHelpers
  include ::FactoryBot::Syntax::Methods
  # Add more helper methods to be used by all tests here...
  setup do
    DatabaseCleaner.clean
  end
end
