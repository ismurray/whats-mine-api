# frozen_string_literal: true

class ChangeWriteAccessDefault < ActiveRecord::Migration[5.1]
  def change
    change_column_default :users_boxes, :write_access, from: false, to: true
  end
end
