# servers
# Defines a single server with a list of roles and multiple properties.
# You can define all roles on a single server, or split them:
#server 'webruby01.cg.lan', user: 'deployer', runner: 'deployer', group: 'deployer', roles: %w{app web worker}
server 'webruby02.cg.lan', user: 'deployer', runner: 'deployer', group: 'deployer', roles: %w{app web db}

# Asset Server
# A server with the [worker] role copies the precompiled data from the precompile server
set :precompile_server, 'webruby02.cg.lan'

# OTAP environment
set :rails_env, 'staging'

# RVM configuration settings
set :rvm_ruby_string, "ruby-2.2.2#{fetch(:application)}"

# Passenger environment settings
set :passenger_rvm_ruby_version, 'ruby-2.2.2@global'

# Passenger restart command for Passenger version 5
set :passenger_restart_command, 'passenger-config restart-app'

# Passenger restart bug (temporary fix)
after :'rvm:hook', :'passenger:rvm:after_rvm_path_is_set'

# Wich branch will be used for deploy
set :branch, 'master'

# You can parallelize the installation of gems with bundler's jobs feature. Choose a number less or equal than the number of cores your server.
set :bundle_jobs, 2

# Symlink environment fil to application root
set :linked_files, fetch(:linked_files, []) + %w{staging.env}