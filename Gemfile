source 'https://rubygems.org'
ruby "2.2.4"

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.5.1'
# Use SCSS for stylesheets
gem 'sass', '~> 3.4.21'
gem 'sass-rails', '~> 5.0.4'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'
# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer',  platforms: :ruby

gem 'turbolinks'
gem 'jquery-turbolinks'

# Use jquery as the JavaScript library
gem 'jquery-rails', '~> 4.1.0'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0',          group: :doc
gem 'devise', "~> 4.0.0.rc1"

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Use debugger
# gem 'debugger', group: [:development, :test]

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin]

gem 'materialize-sass'
# Materialize for Ruby

gem 'paperclip', '~> 4.3.4'
#Paperclip for image processing

gem 'aws-sdk', '< 2.0'
#Amazon web services to store photos and files

gem 'masonry-rails', '~> 0.2.4'
#Tiled images

gem 'will_paginate', '~> 3.0.6'

gem 'will_paginate-materialize', '~> 0.1.0'

group :development, :test do
  # Use sqlite3 as the database for Active Record
  gem 'sqlite3'
end

group :development do
  gem 'better_errors'
  gem "binding_of_caller"
end

#different gems needed for Heroku
group :production do
  gem 'pg'
  gem 'rails_12factor'
end
