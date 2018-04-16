# frozen_string_literal: true

class BoxSerializer < ActiveModel::Serializer
  attributes :id, :name, :items, :users, :permissions

  def users
    object.users.pluck(:id)
  end

  def items
    object.items.pluck(:id)
  end

  def permissions
    object.users_boxes.pluck(:id)
  end
end
