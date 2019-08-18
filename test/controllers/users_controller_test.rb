require 'test_helper'

class UserControllerTest < ActionDispatch::IntegrationTest
    
    test '#create user' do
        latest_user_count = User.count

        user_params = {
            email: 'user@mail.com',
            password: 'password'
        }

        post '/users', params: user_params

        assert_response :success
        assert User.count, latest_user_count + 1
    end
end