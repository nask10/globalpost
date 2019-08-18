FactoryBot.define do
  factory :user do
    email { 'user@mail.com' }
    password { 'password' }
  end

  factory :address do
    street { 'Test St' }
    ext_number { '123' }
    int_number { '456' }
    city { 'City' }
    country { 'Country' }
  end

  factory :parcel do
    user
    origin_address_id { ::FactoryBot.create(:address)._id }
    destination_address_id { ::FactoryBot.create(:address)._id }
    receiver_name { 'Receiver' }
    receiver_email { 'receiver@mail.com' }
  end
end

