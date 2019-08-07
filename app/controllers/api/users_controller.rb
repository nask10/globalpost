class Api::UsersController < Api::BaseController

    def create
        user = User.new(user_params.merge(admin: true))
        if user.save
            render json: { user: user}, status: :ok
        else
            Rails.logger.info user.errors.messages.values.join(', ')
            render json: { message: user.errors.messages.values.join(', ') }, status: :unprocessable_entity
        end
    end

    protected

    def user_params
        params.require(:user).permit(:email, :password) #, :password_confirmation)
    end
end
