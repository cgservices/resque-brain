# config valid only for current version of Capistrano
lock '3.4.1'

set :application, 'resque-brain'
set :repo_url, "git@github.com:/cgservices/#{fetch(:application)}.git"

# Default deploy_to directory is /data/www/my_app_name
set :deploy_to, "/data/www/#{fetch(:application)}"

# Using Creative Group Capistrano recipes
require 'cg_capistrano/recipes/default'
#require 'cg_capistrano/recipes/database'
#require 'cg_capistrano/recipes/assets'
#require 'cg_capistrano/recipes/spree'
require 'cg_capistrano/recipes/whenever'
#require 'cg_capistrano/recipes/resque'
#require 'cg_capistrano/recipes/newrelic'
#require 'cg_capistrano/recipes/translation'
