require "./trip_advisor/hac/defaults"
require "./trip_advisor/hac/entities"

module TripAdvisor
  module Hac
    class HotelInventory < Grape::API
      include TripAdvisor::Hac::Defaults

      resource :hotel_inventory do
        desc "Get detailed information about hotel inventory."
        params do
          requires :api_version, type: Integer, values: [5]
          requires :lang, type: String
          requires :inventory_type, type: String
        end
        get "/" do
          hotels = [
            {
              ta_id: 258705,
              partner_id: "hc456",
              name: "Hotel Commonwealth",
            }
          ]

          present :api_version, api_version
          present :hotels, hotels, with: Entities::Hotel
          present :lang, "fr_FR"
        end
      end

    end
  end
end