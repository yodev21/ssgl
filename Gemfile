source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.5'
gem 'rails', '~> 5.2.4'
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 3.11'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'
gem 'bootsnap', '>= 1.1.0', require: false

gem 'dotenv-rails'
gem 'bootstrap', '~> 4.4.1'
gem 'jquery-rails'
gem 'devise', '~> 4.6.1'
gem 'carrierwave', '~> 1.0'
gem 'mini_magick'
gem 'unicorn'
gem 'ransack'
gem "kaminari"
gem 'acts-as-taggable-on', '~> 6.0'

gem 'mini_racer', platforms: :ruby 
gem "ovirt-engine-sdk"
# gem "fog-aws"
gem "ovirt-engine-sdk"
group :development, :test do
  gem 'capistrano', '3.6.0'
  gem 'capistrano-bundler'
  gem 'capistrano-rails'
  gem 'capistrano-rbenv'
  gem 'capistrano3-unicorn'
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'ed25519'
  gem 'bcrypt_pbkdf'
  gem 'letter_opener_web'
  
  gem "rspec-rails", '~> 3.8.0'
  gem "factory_bot_rails", "~> 4.10.0"
  gem 'webdrivers'
  gem 'pry-rails'
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'bullet'
  gem 'rubocop', require: false
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'spring-commands-rspec'
  gem 'rspec-retry'
end

group :test do
  gem 'capybara', '>= 2.15.2'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
