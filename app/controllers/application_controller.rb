class ApplicationController < ActionController::Base
    before_action :authenticate_user!
    before_action :get_notifications


    def get_notifications
        @notifications_list = JSON.parse(GlobalPost::Notification::HTTP.retrieve(
            current_user.tracking_codes).body) if current_user && !current_user.admin
    end
    
end
