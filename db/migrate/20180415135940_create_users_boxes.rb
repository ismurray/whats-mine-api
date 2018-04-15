# frozen_string_literal: true

class CreateUsersBoxes < ActiveRecord::Migration[5.1]
  def change
    create_table :users_boxes do |t|
      t.references :user, foreign_key: true, null: false
      t.references :box, foreign_key: true, null: false
      t.boolean :write_access, default: false, null: false

      t.timestamps
    end
  end
end
