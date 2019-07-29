class PushParcelToTrackerJob < ApplicationJob
  queue_as :default

  def perform(parcel_id, origin_address_id, destination_address_id)
    parcel = Parcel.find parcel_id
      # HTTP request - GET, POST, PUT, DELETE
      result = GlobalPost::HTTP.create_parcel(
        parcel,
        Address.find(origin_address_id),
        Address.find(destination_address_id)
    ) 
  end
end
