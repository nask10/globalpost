class CreateTrackEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :track_events do |t|
      t.references :parcel
      t.string :location
      t.string :description

      t.timestamps
    end
  end
end
