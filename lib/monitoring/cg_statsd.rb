# CG StastD functions
class CgStatsD
  METRIC_TYPES = { business: 'bi', performance: 'perf' }

  def self.namespace(type = :business, task = nil, action = nil)
    ns = "#{METRIC_TYPES[type]}.#{Rails.application.name_space}"
    ns = "#{ns}.#{task.name.tr(':', '.')}" unless task.nil? || task.class.name == 'String'
    ns = "#{ns}.#{task}" unless task.nil? || task.class.name != 'String'
    ns = "#{ns}.#{action}" unless action.nil?
    ns
  end

  def self.increment(*args, value)
    ns = namespace *args
    writing_to_output ns, value
    StatsD.increment ns, value
  end

  def self.measure(*args, value)
    ns = namespace *args
    writing_to_output ns, value
    StatsD.measure ns, value
  end

  def self.gauge(*args, value)
    ns = namespace *args
    writing_to_output ns, value		
    StatsD.gauge ns, value
  end

  private

  def self.writing_to_output(namespace, value)
    puts "#{namespace}: #{value}" #if Rails.env == 'development'
  end

end
