# frozen_string_literal: true

class BoxSerializer < ActiveModel::Serializer
  attributes :id, :name, :items
  has_many :users, through: :users_boxes

  def items
    object.items.pluck(:id)
  end
end
