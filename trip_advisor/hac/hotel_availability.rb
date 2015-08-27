require "./trip_advisor/hac/defaults"
require "./trip_advisor/hac/entities"

module TripAdvisor
  module Hac
    class HotelAvailability < Grape::API
      include TripAdvisor::Hac::Defaults

      resource :hotel_availability do

        desc "Get price and availability"
        params do
          requires :api_version, type: Integer, values: [5]
          # requires :hotels, type: Array do
          #   requires :ta_id, type: Integer
          #   requires :partner_id, type: String
          #   # optional :partner_url, type: String
          # end
          requires :start_date, type: Date
          requires :end_date, type: Date
          # requires :party, type: Array do
          #   requires :adults, type: Integer
          #   optional :children, type: Integer
          # end
          requires :lang, type: String
          requires :currency, type: String
          requires :user_country, type: String
          requires :device_type, type: String
          requires :query_key, type: String
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
          present :lang, declared(params).lang
          present :start_date, (declared(params).start_date + 1.year)
          present :end_date, (declared(params).end_date + 1.year)
          present :party, declared(params).party
          present :currency, declared(params).currency
          present :user_country, declared(params).user_country
          present :device_type, declared(params).device_type
          present :query_key, declared(params).query_key
          present :hotel_ids, hotels.map { |h| h[:ta_id] }
          present :num_hotels, hotels.size
          present :hotels, hotels, with: Entities::Hotel
        end

      end

    end
  end
end