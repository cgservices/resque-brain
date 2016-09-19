namespace :monitor do
  desc 'Check the number of failed jobs and stat the results to the log in a way statsD can understand'
  task :failed => :environment do
    monitor = Monitoring::Monitor.new(
       checker: Monitoring::FailedJobCheck.new,
      notifier: Monitoring::StatsdNotifier.new(unit: "jobs"))
    monitor.monitor!
  end

  desc 'Check the number of failed jobs and stat the results per class in the failed queue'
  task :failed_by_class => :environment do
    monitor = Monitoring::Monitor.new(
       checker: Monitoring::FailedJobByClassCheck.new,
      notifier: Monitoring::StatsdNotifier.new(unit: "jobs"))
    monitor.monitor!
  end

  desc 'Check the number of stale workers and stat the results to the log in a way StatsD can understand'
  task :stale_workers => :environment do
    monitor = Monitoring::Monitor.new(
       checker: Monitoring::StaleWorkerCheck.new,
      notifier: Monitoring::StatsdNotifier.new(type: :measure, unit: "workers"))

    monitor.monitor!
  end

  desc 'Check the number of active workers in a way StatsD can understand'
  task :workers => :environment do
    monitor = Monitoring::Monitor.new(
        checker: Monitoring::WorkersCheck.new,
        notifier: Monitoring::StatsdNotifier.new(type: :measure, unit: "workers"))
    monitor.monitor!
  end

  desc 'stat the sizes of all queues to the log in a way StatsD can understand'
  task :queue_sizes => :environment do
    monitor = Monitoring::Monitor.new(
       checker: Monitoring::QueueSizeCheck.new,
      notifier: Monitoring::StatsdNotifier.new(unit: "jobs"))

    monitor.monitor!
  end
end
