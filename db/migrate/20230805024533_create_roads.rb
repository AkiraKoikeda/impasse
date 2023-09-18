# frozen_string_literal: true

class CreateRoads < ActiveRecord::Migration[6.1]
  def change
    create_table :roads do |t|

      t.integer :user_id
      t.string :address
      t.string :car_model
      t.float :lat
      t.float :lng
      t.text :situation
      t.string :star

      t.timestamps
    end
  end
end
