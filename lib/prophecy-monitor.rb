require_relative "prophecy-monitor/version"
require_relative "prophecy-monitor/instance"
require_relative "prophecy-monitor/api"

module Prophecy
  module Monitor
    class << self
      # Public: Initializes a new Prophecy::Monitor::Instance.
      #
      # host       - Host on which the Prophecy server is running.
      # prism_port - Optional port on which the Prophecy Prism service is listening.
      # options    - Optional hash used to configure this Prophecy::Monitor (default = nil).
      #                :api_version - Version of the Prophecy::Monitor API to use (drives the schema)
      #
      # Examples
      #
      #   Prophecy::Monitor.new :host       => 'sample.host',
      #                         :prism_port => 9090
      #                         :opts       => { :api_version => "11" }
      #
      # Returns a Prophecy::Monitor::Instance.
      #
      def new(args = nil)
        Prophecy::Monitor::Instance.new args
      end
    end
  end
end
