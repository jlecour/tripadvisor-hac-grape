require "grape"

require "./trip_advisor/hac/config"
require "./trip_advisor/hac/hotel_inventory"
require "./trip_advisor/hac/hotel_availability"

module TripAdvisor
  module Hac
    class Api < Grape::API
      mount TripAdvisor::Hac::Config
      mount TripAdvisor::Hac::HotelInventory
      mount TripAdvisor::Hac::HotelAvailability
    end
  end
end