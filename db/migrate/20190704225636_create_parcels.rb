class CreateParcels < ActiveRecord::Migration[5.2]
  def change
    create_table :parcels do |t|
      t.references :user
      t.string :tracking_code
      t.integer :origin_address_id
      t.integer :destination_address_id
      t.string :receiver_name
      t.string :receiver_phone
      t.string :receiver_email

      t.timestamps
    end
  end
end
