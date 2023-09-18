# frozen_string_literal: true

class CreateRoadComments < ActiveRecord::Migration[6.1]
  def change
    create_table :road_comments do |t|
      t.text :comment
      t.integer :user_id
      t.integer :road_id

      t.timestamps
    end
  end
end
