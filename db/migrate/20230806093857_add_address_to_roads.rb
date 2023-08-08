class AddAddressToRoads < ActiveRecord::Migration[6.1]
  def change
    add_column :roads, :lat, :float
    add_column :roads, :lng, :float
  end
end
