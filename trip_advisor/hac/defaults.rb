require "grape"

module TripAdvisor
  module Hac
    module Defaults

      def self.included(base)
        base.class_eval do

          format :json

          helpers do
            def remote_ip
              "?"
              # env["action_dispatch.remote_ip"].to_s
            end

            def debug_info
              "remote_ip:#{remote_ip}"
            end
          
            def api_version
              5
            end
          end

          # http_basic do |username, password|
          #   username == "tripadvisor" && password == "XXX"
          # end

        end
      end

    end
  end
end