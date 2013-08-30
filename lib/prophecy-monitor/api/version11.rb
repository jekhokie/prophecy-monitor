module Prophecy
  module Monitor
    module Api
      class Version11
        ###########################
        # URL Response Methods
        ###########################

        def connect_path
          "/stats_10"
        end

        ###########################
        # Processing Methods
        ###########################

        def connect_response_valid?(response_code)
          response_code == "200"
        end
      end
    end
  end
end
