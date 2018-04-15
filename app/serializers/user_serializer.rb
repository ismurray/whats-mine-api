# frozen_string_literal: true

class UserSerializer < ActiveModel::Serializer
  attributes :id, :email
  has_many :items
  has_many :boxes, through: :users_boxes
end
