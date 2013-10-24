source 'https://rubygems.org'

ruby "2.0.0"
# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.0.0'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'
# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby
# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 1.2'

# Use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# Use debugger
# gem 'debugger', group: [:development, :test]
gem 'bootstrap-sass'
#gem 'jquery-datatables-rails'
gem 'will_paginate'
gem 'carrierwave'
#gem 'bootstrap-will_paginate'
gem 'rails-i18n'
#gem 'sunspot_rails'
#gem 'progress_bar'
gem "font-awesome-rails"
#gem "nested_form"
gem "nested_form", :git => "git://github.com/ryanb/nested_form.git"

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end
group :development do 
	# Use sqlite3 as the database for Active Record
	gem 'sqlite3'
	# Use Capistrano for deployment
	#gem 'capistrano', '2.9.0', require: false
	gem 'mina'
end
group :production do
	
    gem 'mysql2'
    #gem 'pg', '0.15.1'
    # Use unicorn as the app server
	gem 'unicorn'
end
