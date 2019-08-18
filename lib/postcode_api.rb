
#This API client gets the data from the Google API for the address validation functionality
module Postcode
    class HTTP
        include HTTParty
        base_uri "https://maps.googleapis.com/"

        def initialize
        end

        def self.make_call(path, options = {})
            method = options[:method] || :get
            send(method, path)
        end

        def self.ticker_data(address)
          path= "/maps/api/geocode/json?address=#{address}"
          path << "&key=#{ENV['GOOGLE_GEOCODE_API_KEY']}"
          make_call path
        end
    end
end