class Parcel < ApplicationRecord
    belongs_to :user
    has_many :track_events

    after_create :push_data_to_tracker

    def origin_address
        address = Address.find(origin_address_id)
        "#{address.street} #{address.ext_number} #{address.int_number}, #{address.city}, #{address.country}"
    end

    def destination_address
        address = Address.find(destination_address_id)
        "#{address.street} #{address.ext_number} #{address.int_number}, #{address.city}, #{address.country}"
    end

    def push_data_to_tracker
        PushParcelToTrackerJob.perform_later(
            self.id,
            self.origin_address_id,
            self.destination_address_id
        )               
    end
end
