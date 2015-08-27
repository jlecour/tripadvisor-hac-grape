require "./trip_advisor/hac/defaults"
require "./trip_advisor/hac/entities"

module TripAdvisor
  module Hac
    class Config < Grape::API
      include TripAdvisor::Hac::Defaults

      resource :config do
        desc "Get endpoint configuration."
        get "/" do
          johndoe = {
            full_name: "John Doe",
            email: "john.doe@example.com",
            phone_number: "+123456789",
          }
          janedoe = {
            full_name: "Jane Doe",
            email: "jane.doe@example.com",
            phone_number: "+123456789",
          }
          michael = {
            full_name: "Michael Moore",
            email: "michael@example.com",
            phone_number: "+123456789",
          }
          configuration = {
            emergency_contacts: [johndoe, janedoe],
            info_contacts: [johndoe, michael],
            languages: %w(en),
            pref_hotels: 50,
            five_min_rate_limit: 10_000,
          }

          present :api_version, api_version
          present :configuration, configuration, with: Entities::Configuration
          present :debug_info, debug_info
        end
      end

    end
  end
end