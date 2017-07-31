# Load DSL and set up stages
require 'capistrano/setup'

# Include default deployment tasks
require 'capistrano/deploy'

# Include tasks from other gems included in your Gemfile
#
# For documentation on these, see for example:
#
#   https://github.com/capistrano/rvm
#   https://github.com/capistrano/rbenv
#   https://github.com/capistrano/chruby
#   https://github.com/capistrano/bundler
#   https://github.com/capistrano/rails
#   https://github.com/capistrano/passenger
#
require 'capistrano/rvm'
require 'capistrano/bundler'
#require 'capistrano/rails/assets'
#require 'capistrano/passenger'
#require 'capistrano/maintenance'
#require 'capistrano/faster_assets'

# Include tasks form CGCapistrano
#require 'cg_capistrano/assets'
#require 'cg_capistrano/database'
#require 'cg_capistrano/deface'
#require 'cg_capistrano/rails'

require 'whenever/capistrano'
#require 'capistrano-resque'
#require 'resque/scheduler/tasks'
#require 'capistrano/rails/migrations'
require 'capistrano-nc/nc'
#require 'capistrano-pending'

#require 'cg_capistrano/translations'

# Load custom tasks from `lib/capistrano/tasks` if you have any defined
Dir.glob('lib/capistrano/tasks/*.rake').each { |r| import r }

# Recharge specific plugins
Dir['vendor/gems/*/recipes/*.rb','vendor/plugins/*/recipes/*.rb'].each { |plugin| load(plugin) }
