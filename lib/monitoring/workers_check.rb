module Monitoring
  class WorkersCheck < Monitoring::Checker
    def check!
      @resques.all.map { |resque_instance|
        CheckResult.new(resque_name: resque_instance.name,
                        check_name: 'resque.workers',
                        check_count: resque_instance.workers_running.count)
      }
    end
  end
end
