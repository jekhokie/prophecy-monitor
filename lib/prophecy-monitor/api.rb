Dir[File.expand_path(File.dirname(__FILE__) + '/api/*.rb')].each { |file| require file }

module Prophecy
  module Monitor
    module Api
      class << self
        # Public: Initializes a new Prophecy::Monitor::Api::Version.
        #
        # version - Version of the API to instantiate.
        #
        # Examples
        #
        #   Prophecy::Monitor::Api::Version.new :api_version => '11'
        #
        # Returns a Prophecy::Monitor::Api::Version.
        #
        def new(version)
          if self.supported_versions.include? version
            new_api = self.const_get("Version#{version}").new
          else
            raise "Invalid API version - acceptable versions are: #{self.supported_versions}"
          end

          new_api
        end

        def supported_versions
          [ '11' ]
        end
      end
    end
  end
end
