ENV["RAILS_ENV"] = "test"
require File.expand_path("../../config/environment", __FILE__)
require "rails/test_help"
require "minitest/rails"
require "minitest/reporters"  # for Colorized output

#  For colorful output!
Minitest::Reporters.use!(
  Minitest::Reporters::SpecReporter.new,
  ENV,
  Minitest.backtrace_filter
)


# To add Capybara feature tests add `gem "minitest-rails-capybara"`
# to the test group in the Gemfile and uncomment the following:
require "minitest/rails/capybara"
require 'capybara/minitest/spec'

require 'capybara-screenshot/minitest'

Capybara::Screenshot.autosave_on_failure = true

class ActionDispatch::IntegrationTest
  include Capybara::Screenshot::MiniTestPlugin
end

require 'capybara/poltergeist'
Capybara.default_driver = :poltergeist
Capybara.javascript_driver = :poltergeist

# Uncomment for awesome colorful output
require "minitest/pride"

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all
  # Add more helper methods to be used by all tests here...
end
