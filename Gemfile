source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.7'

gem 'rails', '~> 6.1.7', '>= 6.1.7.3'
# Bundle edge Rails instead: gem 'rails', github: 'rails/rails', branch: 'main'
gem 'active_model_serializers', '~> 0.10.2'
gem 'bootsnap', '>= 1.4.4', require: false
gem 'jwt', '~> 2.7.1'
gem 'bcrypt', '~> 3.1.18'
gem 'dotenv-rails', '~> 2.7.6'
gem 'httparty', '~> 0.13.7'
gem 'pg', '~> 1.1'
gem 'puma', '~> 5.0'
gem 'rack-cors'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'shoulda-matchers', '~> 5.3'
  gem 'rspec', '~> 3.4'
end

group :development do
  gem 'listen', '~> 3.3'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
