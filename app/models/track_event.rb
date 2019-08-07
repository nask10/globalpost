class TrackEvent #< ApplicationRecord
    include Mongoid::Document
    include Mongoid::Timestamps


    field :parcel_id, type: String
    field :location, type: String
    field :description, type: String
    field :created_at, type: DateTime
    field :updated_at, type: DateTime

    belongs_to :parcel
end
