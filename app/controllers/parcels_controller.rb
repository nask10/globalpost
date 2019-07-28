class ParcelsController < ApplicationController
    def index    
        @parcels = current_user.admin? ? Parcel.all : current_user.parcels
    end

    def show
        if params[:code]
            @parcel = Parcel.find_by tracking_code: params[:code]
            GlobalPost::Notification::HTTP.mark_as_read(params[:code])
        else
            @parcel = Parcel.find params[:id]
        end
        @origin_address = Address.find @parcel.origin_address_id
        @destination_address = Address.find @parcel.destination_address_id
    end

    def new
        @parcel = Parcel.new
        @users = User.where(admin: false)
    end

    def create
        origin = Address.create(origin_address_params)
        destination = Address.create(destination_address_params)

            # Ensure generated tracking code does not exist already
            while true do
                tracking_code = SecureRandom.base64(16).gsub(/\W/, '')
                break unless Parcel.find_by tracking_code: tracking_code
            end
    
        @parcel = Parcel.new(parcel_params.merge(
            tracking_code: tracking_code,
            origin_address_id: origin.id,
            destination_address_id: destination.id,
            status: 'added to system'
        ))
        if @parcel.save
            redirect_to parcels_path, notice: 'Item created!'
        else
            render :new, notice: 'Errors'
        end
    end

    private

    def parcel_params
        params.require(:parcel).permit(:user_id, :tracking_code, :receiver_name, :receiver_phone, :receiver_email)
    end

    def origin_address_params
        params.require(:origin_address).permit(:street, :ext_number, :int_number, :city, :country, :zip_code)
    end
    
    def destination_address_params
        params.require(:destination_address).permit(:street, :ext_number, :int_number, :city, :country, :zip_code)
    end

end