source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'

# ruby '2.2.3'

gem 'rails', '~> 5.1.0'
# gem 'railties', '~> 5.0.0'
# gem 'rails-controller-testing'

# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.2', group: :doc

# TODO replace semantic with bootstrap?
gem 'semantic-ui-sass', github: 'doabit/semantic-ui-sass'

# Use ActiveModel has_secure_password
gem 'bcrypt'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'

  # Use sqlite3 as the database for Active Record
  gem 'sqlite3'
end

group :test do
  gem 'minitest-reporters' #, '1.0.5'

  gem 'mini_backtrace' #,     '0.1.3'

  gem 'guard-minitest' #,     '2.3.1'

  gem 'guard-rails'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 3.0'
end

group :production do
  gem 'pg'
  # gem "passenger", ">= 5.0.25", require: "phusion_passenger/rack_handler"
end
