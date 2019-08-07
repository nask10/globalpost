class PushParcelToTrackerJob < ApplicationJob
  queue_as :default

  def perform(parcel_id, origin_address_id, destination_address_id)
    parcel = Parcel.where(id: parcel_id).first
      # HTTP request - GET, POST, PUT, DELETE
      result = GlobalPost::HTTP.create_parcel(
        parcel,
        Address.where(id: origin_address_id).first,
        Address.where(id: destination_address_id).first
    ) 
  end
end
