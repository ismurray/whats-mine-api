# frozen_string_literal: true

class RemoveUserIdFromBoxes < ActiveRecord::Migration[5.1]
  def change
    remove_reference :boxes, :user, foreign_key: true
  end
end
