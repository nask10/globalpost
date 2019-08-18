class UsersController < ApplicationController

    def create
        @user = User.new(user_params)
        password = SecureRandom.base64(8)       
        @user.password = password
        @user.password_confirmation = password
        if @user.save 
            message = 'User added'           
        else
            message = 'Could not create user'
        end
        redirect_to new_parcel_path, notice: message
        @user.send_reset_password_instructions
    end

    private 

    def user_params
        params.require(:user).permit(:email)
    end
end
