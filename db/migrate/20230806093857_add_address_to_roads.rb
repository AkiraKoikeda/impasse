class AddAddressToRoads < ActiveRecord::Migration[6.1]
  def change
    add_column :roads, :latitude, :float
    add_column :roads, :longitude, :float
  end
end
