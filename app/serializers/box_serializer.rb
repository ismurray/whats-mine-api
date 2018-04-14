# frozen_string_literal: true

class BoxSerializer < ActiveModel::Serializer
  attributes :id, :name, :items
  belongs_to :user

  def items
    object.items.pluck(:id)
  end
end
