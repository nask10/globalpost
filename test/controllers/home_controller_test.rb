require 'test_helper'

class HomeControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    DatabaseCleaner.clean
    user = ::FactoryBot.create(:user, email: 'admin@globalpost.com')
    sign_in user
  end

  test '#index' do

    get '/parcels'
    assert_response :success
  end

end