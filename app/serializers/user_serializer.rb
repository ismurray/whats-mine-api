# frozen_string_literal: true

class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :boxes
  has_many :items
  has_many :boxes, through: :users_boxes

  def boxes
    object.boxes.pluck(:id)
  end
end
