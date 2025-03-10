# Ensure Logger::Severity is defined before Rails tries to use it
require 'logger'

unless defined?(::Logger::Severity)
  ::Logger.const_set(:Severity, Module.new do
    DEBUG = 0
    INFO = 1
    WARN = 2
    ERROR = 3
    FATAL = 4
    UNKNOWN = 5

    def self.constants
      [:DEBUG, :INFO, :WARN, :ERROR, :FATAL, :UNKNOWN]
    end
  end)
end
