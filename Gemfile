source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.1'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.2.2'
# Use postgresql as the database for Active Record
gem 'pg', '>= 0.18', '< 2.0'
# Use Puma as the app server
gem 'puma', '~> 3.11'
# Parameter Validation and Type Coercion for Rails
gem 'rails_param', '~> 0.10.2'
# Generate your JSON in an object-oriented and convention-driven manner.
gem 'active_model_serializers', '~> 0.10.9'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
# gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'
# Flexible authentication solution for Rails with Warden
gem 'devise', '~> 4.2'
# Token based authentication for Rails JSON APIs.
gem 'devise_token_auth'
# Describe your service, as JSON endpoints
gem 'rswag-api', '~> 2.0', '>= 2.0.5'
# Expose beautiful API documentation, that's powered by Swagger JSON endpoints.
gem 'rswag-ui', '~> 2.0', '>= 2.0.5'
# A generalized Rack framework for multiple-provider authentication.
gem 'omniauth', '~> 1.6', '>= 1.6.1'
# Use ActiveStorage variant
# gem 'mini_magick', '~> 4.8'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.1.0', require: false
gem 'devise_token_auth'
# Use Rack CORS for handling Cross-Origin Resource Sharing (CORS), making cross-origin AJAX possible
gem 'rack-cors', require: 'rack/cors'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  # Rspec-rails is a testing framework
  gem 'rspec-rails'
  # Generate Swagger files directly from your rspecs
  gem 'rswag-specs'
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end


# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
