# frozen_string_literal: true

class AddIndexToUsersBoxes < ActiveRecord::Migration[5.1]
  def change
    add_index :users_boxes, [:box_id, :user_id], unique: true
  end
end
