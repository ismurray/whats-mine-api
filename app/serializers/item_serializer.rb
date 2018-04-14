# frozen_string_literal: true

class ItemSerializer < ActiveModel::Serializer
  attributes :id, :name, :value
  belongs_to :user
  belongs_to :box
end
