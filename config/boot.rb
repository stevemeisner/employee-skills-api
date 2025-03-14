ENV['BUNDLE_GEMFILE'] ||= File.expand_path('../Gemfile', __dir__)

require 'bundler/setup' # Set up gems listed in the Gemfile.
# require 'bootsnap/setup' # Speed up boot time by caching expensive operations.

# Explicitly require logger and define Logger::Severity if needed
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
