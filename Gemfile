source 'https://rubygems.org'

#gem 'rails', '~> 4.2.5.1'
gem 'rails', '~> 5.0.0'
#gem 'sass-rails', '~> 4.0.3'
gem 'uglifier', '>= 1.3.0'
#gem 'coffee-rails', '~> 4.0.0'
gem 'jquery-rails'
gem 'jbuilder', '~> 2.0'
gem 'spring',        group: :development
gem 'bower-rails'
gem 'resque', github: 'resque/resque', branch: 'master'#'https://github.com/stitchfix/resque.git', branch: 'resque-redis-interface'
#gem 'angular-rails-templates', git: 'https://github.com/davetron5000/angular-rails-templates.git', branch: 'patch-1'
gem 'statsd-instrument', git: 'git@github.com:Shopify/statsd-instrument.git'
gem 'foreman'
gem 'cron2english'
gem 'whenever'
gem 'dotenv-rails'

group :test, :development do
  gem 'capybara'
  gem 'selenium-webdriver'
  gem 'teaspoon-jasmine'
  gem 'dotenv-rails'
  gem 'poltergeist'
  gem 'cg_capistrano', git: 'git@github.com:cgservices/cg_capistrano.git'

  #Pry is a powerful alternative to the standard IRB shell for Ruby. (debugging)
  gem 'pry'
  gem 'pry-nav'
  gem 'pry-rescue'
  gem 'pry-coolline'
  gem 'pry-rails'
  gem 'pry-stack_explorer'
end

group :production, :staging do
    gem 'rails_12factor'
    gem 'rails_stdout_logging'
    gem 'rails_serve_static_assets'
end

gem 'nokogiri', '>= 1.6.7.2'

gem 'rails-html-sanitizer', '~> 1.0.3'
