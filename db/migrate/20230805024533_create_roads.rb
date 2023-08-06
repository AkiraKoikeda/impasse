class CreateRoads < ActiveRecord::Migration[6.1]
  def change
    create_table :roads do |t|
      
      t.integer :user_id
      t.string :address
      t.string :car_model
      t.text :situation
      
      t.timestamps
    end
  end
end
