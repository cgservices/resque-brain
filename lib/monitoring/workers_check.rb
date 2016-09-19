module Monitoring
  class WorkersCheck < Monitoring::Checker
    def check!
      @resques.all.map { |resque_instance|
        resque_instance.workers_running.map { |worker|
          CheckResult.new(resque_name: resque_instance.name,
                          check_name: "resque.workers.#{worker[0, worker.index(':')]}",
                          check_count: 1)
        }
      }
    end
  end
end
