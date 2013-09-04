require 'net/http'

module Prophecy
  module Monitor
    DEFAULT_PRISM_PORT  = 9999
    DEFAULT_API_VERSION = "11"

    class Instance
      attr_accessor :host, :prism_port
      attr_reader   :api_version, :api

      def initialize(args)
        # initialize default attributes
        self.prism_port = Prophecy::Monitor::DEFAULT_PRISM_PORT
        @api_version    = DEFAULT_API_VERSION

        # assign overrideable attributes
        self.host       = args[:host].to_s       unless args[:host].nil?
        self.prism_port = args[:prism_port].to_i unless args[:prism_port].nil?

        unless (extra_opts = args[:opts]).nil?
          @api_version = extra_opts[:api_version].to_s if extra_opts[:api_version]
        end

        begin
          # build a new API object
          @api = Prophecy::Monitor::Api.new(@api_version)
        rescue Exception => e
          raise e.message
        end

        self.valid?
      end

      def valid?
        raise "Missing :host Parameter"                              if self.host.nil?          or self.host.empty?
        raise "Missing or Non-Numeric :prism_port Parameter"         if self.prism_port.nil?    or self.prism_port      == 0 or
                                                                                                   self.prism_port.to_s == ""
        raise ":prism_port not within range 1 < :prism_port < 65535" if self.prism_port > 65535 or self.prism_port < 1

        true
      end

      def api_version=(api_version)
        begin
          # build a new API object
          @api         = Prophecy::Monitor::Api.new(api_version)
          @api_version = api_version
        rescue Exception => e
          raise e.message
        end
      end

      def can_connect?
        begin
          response = Net::HTTP.start(self.host, self.prism_port) do |http|
            request = Net::HTTP::Get.new(@api.connect_path)
            http.request request
          end

          valid_response = @api.connect_response_valid?(response.code)
        rescue Exception => e
          raise e.message
        end

        return valid_response
      end

      def total_sessions
        begin
          can_connect?

          response = Net::HTTP.start(self.host, self.prism_port) do |http|
            http.get(@api.total_sessions_path)
          end

          @api.total_sessions_mapping(response.body)
        rescue Exception => e
          raise e.message
        end
      end

      def sessions_by_application_id
        begin
          can_connect?

          response = Net::HTTP.start(self.host, self.prism_port) do |http|
            http.get(@api.application_ids_sessions_path)
          end

          @api.application_ids_sessions(response.body)
        rescue Exception => e
          raise e.message
        end
      end

      def sessions_for(application_id)
        application_id_sessions = self.sessions_by_application_id

        raise "No Applications Within Prophecy" if application_id_sessions.empty?

        application_id_sessions[application_id]
      end
    end
  end
end
