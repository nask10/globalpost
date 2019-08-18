class Parcel #< ApplicationRecord
    include Mongoid::Document
    include Mongoid::Timestamps

    field :user_id, type: String
    field :tracking_code, type: String
    field :origin_address_id, type: String
    field :destination_address_id, type: String  
    field :receiver_name, type: String  
    field :receiver_phone, type: String  
    field :receiver_email, type: String
    field :created_at, type: DateTime
    field :updated_at, type: DateTime
    field :status, type: String

    belongs_to :user
    has_many :track_events

    after_create :push_data_to_tracker

    def origin_address
        address = Address.where(id: origin_address_id).first
        "#{address.street} #{address.ext_number} #{address.int_number}, #{address.city}, #{address.country}"
    end

    def destination_address
        address = Address.find_by(id: destination_address_id)
        "#{address.street} #{address.ext_number} #{address.int_number}, #{address.city}, #{address.country}"
    end

    def push_data_to_tracker
        PushParcelToTrackerJob.perform_later(
            self._id.to_s,
            self.origin_address_id,
            self.destination_address_id
        ) unless Rails.env == 'test'             
    end
end
