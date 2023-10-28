# frozen_string_literal: true

require 'spec_helper'
ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../config/environment', __dir__)
abort('The Rails environment is running in production mode!') if Rails.env.production?
require 'rspec/rails'
require 'rspec-benchmark'
require 'test_prof/recipes/rspec/let_it_be'
require 'database_cleaner/active_record'
require 'simplecov'
require 'rake'
require 'faker'

Dir[Rails.root.join('spec/support/*.rb')].each { |f| require f }

begin
  ActiveRecord::Migration.maintain_test_schema!
rescue ActiveRecord::PendingMigrationError => e
  puts e.to_s.strip
  exit 1
end

RSpec.configure do |config|
  config.include RSpec::Benchmark::Matchers
  config.include ActiveJob::TestHelper
  config.include ApplicationHelper
  config.include FactoryBot::Syntax::Methods
  config.include ActionView::Helpers::TranslationHelper
  config.include Devise::Test::ControllerHelpers, type: :controller
  config.include Devise::TestHelpers, type: :controller

  config.before(:suite) do
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.clean_with(:truncation)
  end

  config.before do
    DatabaseCleaner.start
  end

  config.append_after do
    DatabaseCleaner.clean
  end

  config.filter_rails_from_backtrace!
  config.fixture_path = Rails.root.join('/spec/fixtures')
  config.use_transactional_fixtures = true
  config.infer_spec_type_from_file_location!
  config.order = :random

  Rails.application.load_tasks
end

Shoulda::Matchers.configure do |config|
  config.integrate do |with|
    with.test_framework :rspec
    with.library :rails
  end
end
