source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.1.0"

# Bundle edge Rails instead: gem "rails", github: "rails/rails", branch: "main"
gem "rails", "~> 7.0.3", ">= 7.0.3.1"

# Use postgresql as the database for Active Record
gem "pg", "~> 1.1"

# Use the Puma web server [https://github.com/puma/puma]
gem "puma", "~> 5.0" 

# gem 'sass-rails', '~> 6.0'

# gem 'webpacker', '~> 5.4', '>= 5.4.3'

gem 'turbolinks', '~> 5.2', '>= 5.2.1'

gem 'jbuilder', '~> 2.11', '>= 2.11.5'

gem 'rest-client', '~> 2.1'

# Build JSON APIs with ease [https://github.com/rails/jbuilder]
# gem "jbuilder"

# Use Redis adapter to run Action Cable in production
# gem "redis", "~> 4.0"

# Use Kredis to get higher-level data types in Redis [https://github.com/rails/kredis]
# gem "kredis"

# Use Active Model has_secure_password [https://guides.rubyonrails.org/active_model_basics.html#securepassword]
# gem "bcrypt", "~> 3.1.7"

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: %i[ mingw mswin x64_mingw jruby ]

# gem 'devise', '~> 4.8', '>= 4.8.1'

gem 'hamlit-rails', '~> 0.2.3'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '~> 1.13', require: false

# Use Active Storage variants [https://guides.rubyonrails.org/active_storage_overview.html#transforming-images]
# gem "image_processing", "~> 1.2"

# Use Rack CORS for handling Cross-Origin Resource Sharing (CORS), making cross-origin AJAX possible
gem "rack-cors"
gem 'devise_token_auth', git: "https://github.com/lynndylanhurley/devise_token_auth"

group :development, :test do
  # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  # gem "debug", platforms: %i[ mri mingw x64_mingw ]
  gem 'byebug', '~> 11.1', '>= 11.1.3'
  gem 'factory_bot_rails'
end

group :development do
  # Speed up commands on slow machines / big apps [https://github.com/rails/spring]
  # gem "spring"
  gem 'web-console', '~> 4.2'
  gem 'listen', '~> 3.7', '>= 3.7.1'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0', '>= 2.0.1'
end

group :test do 
  gem 'rspec-rails', '~> 5.1', '>= 5.1.2'
  gem 'database_rewinder', '~> 0.9.8'
  gem 'shoulda-matchers', '~> 5.1'
  gem 'vcr', '~> 6.1'
  gem 'webmock', '~> 3.18', '>= 3.18.1'
  gem 'rubocop-rails', '~> 2.15', '>= 2.15.2', require: false
  gem 'rubocop-rspec', '~> 2.12', '>= 2.12.1', require: false
end 