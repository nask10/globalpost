class HomeController < ApplicationController

    def index
        if current_user.admin
            @parcels = Parcel.all
        else
            @parcels = current_user.parcels
        end
    end
    
end