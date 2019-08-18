# This is the endpoint for track_events
class Api::TrackEventsController < Api::BaseController

    def create
        begin
            parcel = Parcel.find_by tracking_code: params[:tracking_code]
            parcel.track_events.create location: params[:location], description: params[:description]

            if params[:delivery_status] == 'delivered'
                parcel.update status: 'delivered'
            end
        
            render json: {result: 'Parcel tracking history was updated'}, status: :ok
        rescue
            render json: {error_messages: parcel.errors.messages.values.join(', ')}, status: :unprocessable_entity
        end
    end
end