class Api::BaseController < ApplicationController
    protect_from_forgery with: :null_session
    skip_before_action :authenticate_user!
    skip_before_action :get_notifications
    before_action :authenticate_request

    def authenticate_request
        if request.headers['X-GLOBALPOST-SYS'] == 'foo'
            return true
        else
            render json: {message: 'Not authorized!'}, status: :unauthorized
        end
    end
end