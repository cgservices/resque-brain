# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

# Example:
#
# set :output, "/path/to/my/cron_log.log"
#
# every 2.hours do
#   command "/usr/bin/some_great_command"
#   runner "MyModel.some_method"
#   rake "some:great:rake:task"
# end
#
# every 4.days do
#   runner "AnotherModel.prune_old_records"
# end

# Learn more: http://github.com/javan/whenever

@log_settings = ">> ~/resque-brain/shared/log/cron.log"

case @environment
  when 'staging'

   default_command = "cd #{@path} && rvm use ruby-2.2.2@resque-brain && RAILS_ENV=#{@environment} bundle exec rake "

   every 1.minute do
      command "#{default_command} monitor:failed #{@log_settings}"
   end

   every 1.minute do
      command "#{default_command} monitor:failed_by_class #{@log_settings}"
   end

   every 1.minute do
     command "#{default_command} monitor:stale_workers #{@log_settings}"
   end

   every 1.minute do
     command "#{default_command} monitor:workers #{@log_settings}"
   end

   every 1.minute do
     command "#{default_command} monitor:queue_sizes #{@log_settings}"
   end

end