require 'test_helper'

class PostcodeControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    user = ::FactoryBot.create(:user)
    sign_in user
  end

  test '#postcode' do
    get '/postcode'

    assert_response :success
  end

  test '#lookup_postcode' do
    post '/lookup_postcode', params: { symbol: '3 Waterville , Dublin' }
    assert_response :success
  end

end