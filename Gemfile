source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.1.1"

# Bundle edge Rails instead: gem "rails", github: "rails/rails", branch: "main"
# "~> 7.0.3", ">= 7.0.3.1"
gem "rails", 
gem 'pg_search', '~> 2.3', '>= 2.3.6'
# Use postgresql as the database for Active Record
gem "pg", "~> 1.1"
gem "bcrypt"
# Use the Puma web server [https://github.com/puma/puma]
gem "puma", "~> 5.0"
gem "aws-sdk-s3"
# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: %i[ mingw mswin x64_mingw jruby ]
gem "jbuilder"
# Use Rack CORS for handling Cross-Origin Resource Sharing (CORS), making cross-origin AJAX possible
# gem "rack-cors"
gem "pry-rails"



group :development, :test do
  # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  gem "debug", platforms: %i[ mri mingw x64_mingw ]
  gem "annotate"
end

group :development do
  # Speed up commands on slow machines / big apps [https://github.com/rails/spring]
  # gem "spring"
end

