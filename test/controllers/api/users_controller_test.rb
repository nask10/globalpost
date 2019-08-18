require 'test_helper'
class Api::UsersControllerTest < ActionDispatch::IntegrationTest

    test '#create - Without the validation header' do
        post '/api/users', params: { user: {email: 'api.user@mail.com' }}
        assert_response :unprocessable_entity
    end

    test '#create - With the validation header and required data' do
        post '/api/users', 
            headers: { 'X-GLOBALPOST-SYS' => ENV['GLOBALPOST_APP_KEY'] },
            params: { user: {
                    email: 'api.user@mail.com',
                    password: 'somepassword'
                }
            }
        assert_response :ok
    end

end