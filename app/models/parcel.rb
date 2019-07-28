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

        # HTTP request - GET, POST, PUT, DELETE
        result = GlobalPost::HTTP.create_parcel(
            self,
            Address.find(origin_address_id),
            Address.find(destination_address_id)
        )
        
        

        # ActiveJob.send_data_to_m2
        # OR
        # RabbitMQ.send_data_to_m2
    end
end
