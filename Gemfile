source "https://rubygems.org"
git_source(:github) { |repo| 'https://github.com/#{repo}.git' }

ruby "2.6.5"

gem "audited"
gem "bcrypt"
gem "dotenv-rails"
gem "bootsnap", ">= 1.4.2", require: false
gem "graphql-batch"
gem "jbuilder", "~> 2.7"
gem "jwt"
gem "paranoia", "~> 2.2"
gem "pg", ">= 0.18", "< 2.0"
gem "puma", "~> 3.12"
gem "rack-cors"
gem "rails", "~> 6.0.0"
gem "rubocop"
gem "whenever", require: false

group :development, :test do
  gem "byebug", platforms: [:mri, :mingw, :x64_mingw]
  gem "factory_bot_rails"
  gem "faker", git: "https://github.com/faker-ruby/faker.git", branch: "master"
  gem "rspec-rails", "~> 3.8"
  gem "standard"
  gem "spring-commands-rspec"
end

group :development do
  gem "graphiql-rails"
  gem "graphql", "~> 1.9", ">= 1.9.3"
  gem "listen", ">= 3.0.5", "< 3.2"
  gem "spring"
  gem "spring-watcher-listen", "~> 2.0.0"
end

group :test do
  gem "shoulda-matchers"
end

gem "tzinfo-data", platforms: [:mingw, :mswin, :x64_mingw, :jruby]
