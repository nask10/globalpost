module Postcode
    class HTTP
        include HTTParty
        base_uri "https://api.postcodes.io"

        def initialize
        end

        def make_call(path, options = {})
            method = options[:method] || :get
            self.class.send(method, path)
        end

        def ticker_data(postcode)
          path= "api.postcodes.io/postcodes"
          make_call
        end
    end
end