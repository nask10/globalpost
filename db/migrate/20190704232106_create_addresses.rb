class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.string :street
      t.string :ext_number
      t.string :int_number
      t.string :city
      t.string :country

      t.timestamps
    end
  end
end
