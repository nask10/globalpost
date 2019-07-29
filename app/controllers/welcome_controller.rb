class WelcomeController < ApplicationController
    skip_before_filter :authenticate_user!

    def index
    end

    def features
    end

    def faq
    end

    def about
    end
    
end