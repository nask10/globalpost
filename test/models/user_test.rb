require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test '#tracking_codes' do
    user = User.create(email: 'test@mail.com', password: 'password')

    parcel1 = Parcel.create(
        user_id: user._id,
        origin_address_id: Address.create(
            street: 'Origin Street',
            ext_number: '123',
            int_number: '234',
            city: 'Origin City',
            country: 'Origin Country')._id,
        destination_address_id: Address.create(
            street: 'Destination Street',
            ext_number: '123',
            int_number: '234',
            city: 'Destination City',
            country: 'Destination Country')._id,
        receiver_name: 'Jane',
        receiver_email: 'test.2@mail.com',
        status: 'in transit'
    )

    parcel2 = Parcel.create(
        user_id: user._id,
        origin_address_id: Address.create(
            street: 'Origin Street',
            ext_number: '123',
            int_number: '234',
            city: 'Origin City',
            country: 'Origin Country')._id,
        destination_address_id: Address.create(
            street: 'Destination Street',
            ext_number: '123',
            int_number: '234',
            city: 'Destination City',
            country: 'Destination Country')._id,
        receiver_name: 'Jane',
        receiver_email: 'test.2@mail.com',
        status: 'delivered'
    )

    assert user.tracking_codes.length, 1

  end
end
