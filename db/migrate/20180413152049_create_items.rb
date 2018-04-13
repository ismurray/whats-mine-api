# frozen_string_literal: true

class CreateItems < ActiveRecord::Migration[5.1]
  def change
    create_table :items do |t|
      t.text :name, null: false
      t.integer :value
      t.references :user, foreign_key: true, null: false

      t.timestamps
    end
  end
end
