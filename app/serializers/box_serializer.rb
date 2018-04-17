# frozen_string_literal: true

class BoxSerializer < ActiveModel::Serializer
  attributes :id, :name, :items, :users, :permissions, :editable

  def users
    object.users.pluck(:id)
  end

  def items
    object.items.pluck(:id)
  end

  def permissions
    object.users_boxes.pluck(:id)
  end

  # Returns (T/F) based on the user's write_access for the current Box
  def editable
    # find the users_box entry for the current Box and the current user
    @users_box = object.users_boxes.where(user_id: scope.id).first
    # return the write_access
    @users_box[:write_access]
  end
end
