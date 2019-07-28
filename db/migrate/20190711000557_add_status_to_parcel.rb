class AddStatusToParcel < ActiveRecord::Migration[5.2]
  def change
    add_column :parcels, :status, :string
  end
end
