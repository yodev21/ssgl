# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.0.1'
gem 'rails', '~> 6.1.3.1'
gem 'bootsnap', '>= 1.1.0', require: false
gem 'coffee-rails', '~> 4.2'
gem 'jbuilder', '~> 2.5'
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 3.11'
gem 'sass-rails', '~> 5.0'
gem 'turbolinks', '~> 5'
gem 'uglifier', '>= 1.3.0'

gem 'acts-as-taggable-on'
gem 'bootstrap', '~> 4.4.1'
gem 'carrierwave', '~> 1.0'
gem 'devise'
gem 'dotenv-rails'
gem 'jquery-rails'
gem 'kaminari'
gem 'mini_magick'
gem 'ransack'
gem 'unicorn'

gem 'fog-aws'
gem 'mini_racer', platforms: :ruby

gem 'redcarpet'
gem 'font-awesome-sass'

group :development, :test do
  gem 'bcrypt_pbkdf'
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'capistrano', '3.6.0'
  gem 'capistrano-bundler'
  gem 'capistrano-rails'
  gem 'capistrano-rbenv'
  gem 'capistrano3-unicorn'
  gem 'ed25519'
  gem 'letter_opener_web'

  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'bullet'
  gem 'factory_bot_rails'
  gem 'pry-rails'
  gem 'rspec-rails'
  gem 'rubocop', require: false
  gem 'rubocop-rails'
  gem 'webdrivers'
end

group :development do
  gem 'listen'
  gem 'rspec-retry'
  gem 'spring'
  gem 'spring-commands-rspec'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'web-console', '>= 3.3.0'
end

group :test do
  gem 'capybara'
end

gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
