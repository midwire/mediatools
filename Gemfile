# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.5'

gem 'rails', '~> 6.0.2', '>= 6.0.2.1'

gem 'bcrypt', '~> 3.1.7' # Use Active Model has_secure_password
gem 'bootsnap', '>= 1.4.2', require: false # Reduces boot times through caching
gem 'bullet', '~> 6.1' # reduce N+1 queries
gem 'chronic', '~> 0.10' # Parse date and time strings
gem 'dotenv-rails', '~> 2.2' # Keep security-related data out of the repository
gem 'file_validators', '~> 2.3' # Validate ActiveStorage file attachments
gem 'haml-rails', '~> 1.0' # HTML templating engine
gem 'image_processing', '~> 1.2' # Use Active Storage variant
gem 'jbuilder', '~> 2.7'
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 4.1'
gem 'redis', '~> 4.0' # Use Redis adapter to run Action Cable in production
gem 'ruby-filemagic', '~> 0.7.2' # Determine mime types
gem 'sass-rails', '>= 6'
gem 'themoviedb'
gem 'turbolinks', '~> 5'
gem 'webpacker', '~> 4.0'

group :development, :test do
  gem 'factory_bot_rails'
  gem 'faker'
  gem 'pry-nav'
  gem 'rspec-activemodel-mocks' # required to mock out AR instances
  gem 'rspec-rails', '~> 4.0.0.beta3'
  gem 'rubocop', '0.78' # lock this in case default Rubocop rules change as they are wont to do
  gem 'rubocop-rails'
end

group :development do
  gem 'annotate', github: 'ctran/annotate_models', branch: 'develop'
  gem 'pry-rails'

  # Use Capistrano for deployment
  gem 'capistrano-bundler', '~> 1.2'
  gem 'capistrano-passenger'
  gem 'capistrano-rails', '~> 1.3'
  gem 'capistrano-rbenv', '~> 2.0'
end

group :test do
  gem 'database_cleaner', github: 'DatabaseCleaner/database_cleaner', branch: 'master'
  gem 'ruby-prof', '>= 0.16.0'
  gem 'shoulda-matchers'
  gem 'simplecov'
  gem 'test-prof'
end
