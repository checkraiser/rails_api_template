# This file is copied to spec/ when you run 'rails generate rspec:install'
ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
# Prevent database truncation if the environment is production
abort('The Rails environment is running in production mode!') if Rails.env.production?
require 'spec_helper'
require 'rspec/rails'
require 'simplecov'
SimpleCov.start 'rails' do
  add_filter '/lib/'
  add_filter '/jobs/'
  add_filter '/mailers/'
  add_filter '/channels/'
  add_group 'Serializers', '/serializers/'
end

Faker::Config.locale = 'en-US'

Dir[Rails.root.join('spec', 'models', 'contexts', '**', '*.rb')].each { |f| require f }
Dir[Rails.root.join('spec', 'models', 'examples', '**', '*.rb')].each { |f| require f }
Dir[Rails.root.join('spec', 'controllers', 'api', 'v1', 'contexts', '**', '*.rb')].each { |f| require f }
Dir[Rails.root.join('spec', 'supports', '**', '*.rb')].each { |f| require f }
Dir[Rails.root.join('spec', 'shared_examples', '**', '*.rb')].each { |f| require f }
# Checks for pending migration and applies them before tests are run.
# If you are not using ActiveRecord, you can remove this line.
ActiveRecord::Migration.maintain_test_schema!

RSpec.configure do |config|
  config.include ParamsHelper
  config.include FakerHelper
  config.include ModelHelper
  config.include UserHelper
  config.include TicketHelper
  config.include ReplyHelper
  # Remove this line if you're not using ActiveRecord or ActiveRecord fixtures
  config.fixture_path = "#{::Rails.root}/spec/fixtures"

  config.use_transactional_fixtures = true

  config.infer_spec_type_from_file_location!

  # Filter lines from Rails gems in backtraces.
  config.filter_rails_from_backtrace!
  # arbitrary gems may also be filtered via:
  # config.filter_gems_from_backtrace("gem name")
  config.before(:suite) do
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.clean_with(:truncation)
  end

  config.around(:each) do |example|
    DatabaseCleaner.cleaning do
      example.run
    end
  end

  config.around(:each, freeze: true) do |example|
    time = example.metadata.fetch(:freeze)
    Timecop.freeze(time.eql?(true) ? Date.current : time) do
      example.run
    end
  end
end
