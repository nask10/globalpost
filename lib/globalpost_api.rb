# This is an API client to communicate with micro-service 2
module GlobalPost
    class HTTP
        include HTTParty

        base_uri ENV['GLOBALPOST_TRACKING_URL']

        # This method communicates with the create_parcel API endpoint in micro-service 2
        def self.create_parcel(parcel, origin_address, destination_address)
            post(
                '/api/parcels',
                headers: {
                    'X-GLOBALPOST-SYS' => ENV['GLOBALPOST_APP_KEY']
                },
                body: {
                    parcel: {
                        tracking_code: parcel.tracking_code,                       
                        receiver_name: parcel.receiver_name,
                        receiver_phone: parcel.receiver_phone,
                        receiver_email: parcel.receiver_email                       
                    },
                    origin_address: {
                        street: origin_address.street,
                        ext_number: origin_address.ext_number,
                        int_number: origin_address.int_number,
                        city: origin_address.city,
                        country: origin_address.country,
                        zip_code: origin_address.zip_code
                    },
                    destination_address: {
                        street: destination_address.street,
                        ext_number: destination_address.ext_number,
                        int_number: destination_address.int_number,
                        city: destination_address.city,
                        country: destination_address.country,
                        zip_code: destination_address.zip_code
                    }
                }
            )

        end

        # Send a PUT request to users_controller#update in microservice 2 API endpoint
        def self.sync_user(email, password)
            Rails.logger.info "[API client] performing HTTP PUT request..."
            put(
                "/api/users/#{email}",
                headers: {
                    'X-GLOBALPOST-SYS' => ENV['GLOBALPOST_APP_KEY']
                },
                body: {
                    user: {
                        email: email,
                        password: password #,
                        #password_confirmation: user.encrypted_password_confirmation

                    }
                }
            )

        end

    end
    
end