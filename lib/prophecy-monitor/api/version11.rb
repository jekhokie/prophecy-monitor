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

        def application_ids_sessions_path
          "/stats_10?type=snapshot&full=false"
        end

        ###########################
        # Processing Methods
        ###########################

        def connect_response_valid?(response_code)
          response_code == "200"
        end

        def application_ids_sessions(response)
          applications_sessions_list = Hash.new
          doc                        = Nokogiri::XML response

          doc.xpath("/ns2:snapshot/application").each do |application_xml|
            applications_sessions_list[application_xml.attr("id")] = application_xml.xpath("./stats/activesessions").first.text.to_i
          end

          applications_sessions_list
        end
      end
    end
  end
end
