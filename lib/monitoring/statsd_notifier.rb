require "#{Rails.root}/lib/monitoring/cg_statsd"

module Monitoring
  class StatsdNotifier < Notifier
    def initialize(logger: Rails.logger, type: :count, unit: "")
      @logger = logger
      @type   = type
      @unit   = unit || ""
    end

    # Log metrics based on the hash passed in.
    #
    # results:: a hash where the keys represent the source (the resque instance name) and the values
    #           are lists of items to be counted.  The items won't be examined, just counted and used in the metric
    def notify!(check_results)
      check_results.each do |check_result|
        if check_result.is_a?(Array)
          results = Hash.new
          check_result.each do |sub_result|
            counter = 0
            counter = results[sub_result.check_name][:counter] unless results[sub_result.check_name].nil?
            results[sub_result.check_name] = { name: sub_result.check_name,
                                               source: [sub_result.resque_name,sub_result.scope].compact.join("."),
                                               counter: counter + sub_result.check_count}
          end
          results.each do |key, value|
            log_to_statsd(value[:source], @type, value[:name], value[:counter])
          end
        else
          source = [check_result.resque_name,check_result.scope].compact.join(".")
          log_to_statsd(source,@type,check_result.check_name,check_result.check_count)
        end
      end
    end

  protected

    def log_to_statsd(source, type, prefix, size)
      CgStatsD.gauge :business, prefix, source.downcase, size
    end

  private

    def validate_prefix!(prefix)
      raise ArgumentError,"You must supply a prefix" if String(prefix).strip == ''
      raise ArgumentError,"prefix should only have numbers, letters, and dots" unless prefix =~/^[0-9_a-zA-Z\-\.]+$/
      prefix
    end
  end
end
