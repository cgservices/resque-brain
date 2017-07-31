# basic configuration per environment for the statsD gem
StatsD.backend = StatsD::Instrument::Backends::UDPBackend.new("10.1.0.79:8125", :statsd)

# Sample 100% of events. By default all events are reported, which may overload your network or server.
# You can, and should vary this on a per metric basis, depending on frequency and accuracy requirements
StatsD.default_sample_rate = (ENV['STATSD_SAMPLE_RATE'] || 1.0 ).to_f
