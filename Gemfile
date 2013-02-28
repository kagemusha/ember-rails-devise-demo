source 'https://rubygems.org'
gem 'rails', '3.2.12'
gem 'sqlite3'

gem 'jquery-rails'
gem 'ember-rails'


gem "thin", ">= 1.5.0", :group => [:development, :test]
gem "haml", ">= 3.1.7"
gem "rspec-rails", ">= 2.12.2", :group => [:development, :test]
gem "factory_girl_rails", ">= 4.2.0", :group => [:development, :test]
gem "bootstrap-sass", ">= 2.2.2.0"
gem "devise", ">= 2.2.3"
gem "cancan", ">= 1.6.8"
gem "rolify", ">= 3.2.0"
gem "active_model_serializers"
gem "figaro", ">= 0.5.3"

group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'uglifier', '>= 1.0.3'
end



group :development do
  gem "quiet_assets", ">= 1.0.1"
  gem "better_errors", ">= 0.3.2"
  gem "binding_of_caller", ">= 0.6.8"
  gem "haml-rails", ">= 0.3.5"
  gem "hpricot", ">= 0.8.6"
  gem "ruby_parser", ">= 3.1.1"
end

group :test do
  gem "capybara", ">= 2.0.2"
  gem "poltergeist"
  gem "capybara-webkit"
  gem "database_cleaner", ">= 0.9.1"
  gem "email_spec", ">= 1.4.0"
  gem 'capybara-screenshot'
end

group :test, :development do
  gem 'konacha'
  #gem 'poltergeist' #replace capy-webkit
end