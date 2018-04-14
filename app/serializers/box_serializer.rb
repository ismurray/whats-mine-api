# frozen_string_literal: true

class BoxSerializer < ActiveModel::Serializer
  attributes :id, :name
  belongs_to :user
  has_many :items
end
