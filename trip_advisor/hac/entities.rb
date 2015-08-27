require "grape-entity"

module TripAdvisor
  module Hac
    module Entities

      class ContactInfo < Grape::Entity
        expose :full_name
        expose :email
        expose :phone_number
      end
    
      class Configuration < Grape::Entity      
        expose :emergency_contacts, with: ContactInfo
        expose :info_contacts, with: ContactInfo
        expose :languages
        expose :pref_hotels
        expose :five_min_rate_limit
      end
    
      class Hotel < Grape::Entity
        expose :ta_id
        expose :partner_id
        expose :name
      end

    end
  end
end