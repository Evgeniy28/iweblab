source 'https://rubygems.org'
ruby '2.2.0'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.0'
gem 'slim'

group :assets do 
	# Use SCSS for stylesheets
	gem 'sass-rails', '~> 5.0'
	# Use Uglifier as compressor for JavaScript assets
	gem 'uglifier', '>= 1.3.0'
	# Use CoffeeScript for .coffee assets and views
	gem 'coffee-rails', '~> 4.1.0'
end
# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', require: false, group: :doc

# Use ActiveModel has_secure_password
gem 'bcrypt', '~> 3.1.7'

# Use Unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
	gem 'rspec-rails', '3.2.0'
	gem 'factory_girl_rails'
	# gem 'guard-rspec', '4.5.0'
	# gem 'spork-rails', '4.0.0'
	# gem 'guard-spork', '2.1.0'
	# gem 'childprocess', '0.5.5'
	gem 'guard-livereload', '2.4.0'

	# Use sqlite3 as the database for Active Record
	gem 'sqlite3'

	# Call 'byebug' anywhere in the code to stop execution and get a debugger console
	gem 'byebug'

	# Access an IRB console on exception pages or by using <%= console %> in views
	gem 'web-console', '~> 2.0'
end

# Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
gem 'spring', group: :development

group :test do
	gem 'shoulda-matchers'
	gem 'selenium-webdriver', '2.35.1'
	gem 'capybara', '2.4.4'
	gem 'growl', '1.0.3'
end

group :production do
	gem 'pg', '0.18.1'
	gem 'rails_12factor', '0.0.3'
end

