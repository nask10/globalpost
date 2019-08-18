require 'test_helper'

class ParcelsControllerTest < ActionDispatch::IntegrationTest
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

  test '#show' do
    parcel = ::FactoryBot.create(:parcel)
    get '/parcels/' + parcel._id
    assert_response :success
  end

  test '#new' do
    get '/parcels/new'
    assert_response :success
  end

  test '#create' do
    le_params = {
        parcel: {
          user_id: ::FactoryBot.create(:user)._id,
          receiver_name: 'Receiver',
          receiver_email: 'receiver@mail.com'
      },
      origin_address: {
          street: 'Origin St',
          ext_number: '1',
          int_number: '2',
          city: 'Origin City',
          country: 'Origin Country'
      },
      destination_address: {
          street: 'Destination St',
          ext_number: '1',
          int_number: '2',
          city: 'Destination City',
          country: 'Destination Country'
      }
    }
    post '/parcels', params: le_params
    assert Parcel.count, 1
  end
end