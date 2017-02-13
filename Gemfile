source 'https://rubygems.org'

# Pannello Amministratore
gem 'rails_admin', git: 'https://github.com/sferik/rails_admin.git'
gem 'rails_admin_rollincode', git: 'https://github.com/rollincode/rails_admin_theme.git'
gem 'rails_admin_history_rollback', git: 'https://github.com/rikkipitt/rails_admin_history_rollback.git'
gem 'rails_admin_nestable', '~> 0.3.2'
gem "rails_admin_import", ">= 2.0"
# Athenticazione e Authorizzazione
gem 'devise'
gem 'cancancan'
# User action history
gem 'paper_trail'
# Implementazione IS-A
gem 'activerecord', '>= 4.2.6'
gem 'active_record-acts_as'
# Upload immagini
gem 'carrierwave', git: 'https://github.com/carrierwaveuploader/carrierwave.git'
gem 'carrierwave-crop-on-fly'
gem "mini_magick"
# Validate email
gem 'email_validator'
gem 'codice-fiscale', git: 'https://github.com/topac/codice_fiscale'
# Carrello
gem 'acts_as_shopping_cart', '~> 0.4.1'
gem 'paypal-sdk-rest'
# View
gem 'twitter-typeahead-rails', git: 'https://github.com/yourabi/twitter-typeahead-rails.git'
gem 'bootstrap-typeahead-rails'
gem 'handlebars_assets'
gem 'simple_form', git: 'https://github.com/plataformatec/simple_form.git'
gem 'railsstrap', git: 'https://github.com/toadkicker/railsstrap.git' # Sostituisce Twitter-Bootstrap-Rails
gem 'devise-bootstrapped', git: 'https://github.com/king601/devise-bootstrapped.git'
gem 'font-awesome-rails'
gem 'wysiwyg-rails'
# Api Google Maps
gem 'gmaps4rails'
gem 'geocoder'
gem 'underscore-rails' # Richiesto da gmaps4rails
# I18n
gem 'rails-i18n'

# Preprocessore Less per bootstrap
gem "therubyracer"
gem 'less-rails', git: 'https://github.com/Genkilabs/less-rails' #fix for deprecated Sprockets ImportProcessor

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 4.2'
gem 'sprockets', '>= 3.7.0'
# Use sqlite3 as the database for Active Record
gem 'sqlite3'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '>= 4.1.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '>= 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '>= 0.4.0', group: :doc

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Webserver
gem 'puma'

group :development, :test do
  # Test Engine
  gem 'rspec-rails'
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'
  #Test Engine User
  gem 'capybara'

end

group :development do
  # Generatore di Diagrammi ER
  gem "rails-erd"
  gem "railroady"
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '>= 2.0'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
end
