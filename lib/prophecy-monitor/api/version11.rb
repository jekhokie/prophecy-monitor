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

        def total_sessions_path
          "/sessions_10"
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

        def total_sessions_mapping(response)
          total_sessions_list = Hash.new

          total_sessions_list["CallXML"] = response.scan(/CallXML.*/).first.split(':').last.strip.to_i
          total_sessions_list["CCXML10"] = response.scan(/CCXML10.*/).first.split(':').last.strip.to_i

          total_sessions_list
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
