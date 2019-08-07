class WelcomeController < ApplicationController
    skip_before_action :authenticate_user!

    def index
        redirect_to dashboard_path if user_signed_in?
    end

    def features
    end

    def faq
    end

    def about
    end
    
end