source "https://rubygems.org"

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

group :production do
 gem "rails_12factor"
end

gem "carrierwave"
gem "coffee-rails", "~> 4.2"
gem "devise"
gem "jbuilder", "~> 2.5"
gem "mysql2", group: :development
gem 'pg', group: :production
gem "puma", "~> 3.7"
gem "rails", "~> 5.1.4"
gem "rmagick"
gem "sass-rails", "~> 5.0"
gem "turbolinks", "~> 5"
gem "uglifier", ">= 1.3.0"
gem "acts_as_follower", github: "tcocca/acts_as_follower", branch: "master"
gem 'acts-as-taggable-on', '~> 4.0'
gem 'bootstrap-sass', '~> 3.3.7'
gem 'jquery-rails'

group :development, :test do
  gem "byebug", platforms: [:mri, :mingw, :x64_mingw]
  gem "capybara", "~> 2.13"
  gem "pry-rails"
  gem "rubocop", "~> 0.52.0", require: false
  gem "selenium-webdriver"
end

group :development do
  gem "listen", ">= 3.0.5", "< 3.2"
  gem "spring"
  gem "spring-watcher-listen", "~> 2.0.0"
  gem "web-console", ">= 3.3.0"
end

gem "tzinfo-data", platforms: [:mingw, :mswin, :x64_mingw, :jruby]
