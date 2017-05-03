source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end
# run ActiveRecord queries using only regular Hash
gem 'active_hash_relation'
# Serialize model to json
gem 'active_model_serializers', '~> 0.10.0'
# Use ActiveModel has_secure_password
gem 'bcrypt', '~> 3.1.7'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
# gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'
# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development
gem 'hamster'
# Use mysql as the database for Active Record
gem 'mysql2', '>= 0.3.18', '< 0.5'
# Use Puma as the app server
gem 'puma', '~> 3.0'
# Whitelisting api requests
gem 'rack-attack'
# Use Rack CORS for handling Cross-Origin Resource Sharing (CORS), making cross-origin AJAX possible
gem 'rack-cors'
# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.1'
# Command pattern
gem 'simple_command'
# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platform: :mri
  # Random data generation for test
  gem 'faker'
  gem 'mutant-rspec'
  # Debugging in tests
  gem 'pry-byebug'
  # RDoc generation
  gem 'rdoc'
  # RSpec for unit testing
  gem 'rspec-rails', '~> 3.5'
  # Static code analysis
  gem 'rubocop', require: false
  # # Static code analysis for rspec
  gem 'rubocop-rspec'
  # Freeze time
  gem 'timecop'
end

group :development do
  # Security checking
  gem 'brakeman', require: false
  gem 'fast_stack' # For Ruby MRI 2.0
  # For call-stack profiling flamegraphs (requires Ruby MRI 2.0.0+)
  gem 'flamegraph'
  gem 'listen', '~> 3.0.5'
  # For memory profiling (requires Ruby MRI 2.1+)
  gem 'memory_profiler'
  # Profiling rails app
  gem 'rack-mini-profiler', require: false
  # Rails best practices
  gem 'rails_best_practices'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'stackprof' # For Ruby MRI 2.1+
end

group :test do
  # Test JSON API
  gem 'airborne'
  gem 'codeclimate-test-reporter'
  # Clean database for each test case
  gem 'database_cleaner', github: 'DatabaseCleaner/database_cleaner'
  # Test coverage
  gem 'simplecov', require: false
  gem 'shoulda-matchers', git: 'https://github.com/thoughtbot/shoulda-matchers.git', branch: 'rails-5'
end
