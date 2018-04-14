# frozen_string_literal: true

class AddBoxRefToItems < ActiveRecord::Migration[5.1]
  def change
    add_reference :items, :box, foreign_key: true
  end
end
