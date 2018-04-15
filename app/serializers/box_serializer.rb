# frozen_string_literal: true

class BoxSerializer < ActiveModel::Serializer
  attributes :id, :name, :items, :users

  def users
    object.users.pluck(:id)
  end

  def items
    object.items.pluck(:id)
  end
end
