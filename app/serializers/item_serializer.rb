# frozen_string_literal: true

class ItemSerializer < ActiveModel::Serializer
  attributes :id, :name, :value, :box
  belongs_to :user

  def box
    object.box.id
  end
end
