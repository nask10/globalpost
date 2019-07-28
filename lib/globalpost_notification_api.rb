module GlobalPost::Notification
    class HTTP
        include HTTParty

        base_uri ENV['GLOBALPOST_NOTIFICATION_URL']

        def self.retrieve(list)
            get(
                "/api/notifications?codes=#{list.join(',')}",
                headers: {
                    'X-GLOBALPOST-SYS' => ENV['GLOBALPOST_APP_KEY']
                }
            )

        end

        def self.mark_as_read(tracking_code)
            put(
                "/api/notifications/#{tracking_code}",
                headers: {
                    'X-GLOBALPOST-SYS' => ENV['GLOBALPOST_APP_KEY']
                }
            )
        end
    end
   
end