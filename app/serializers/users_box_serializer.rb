# frozen_string_literal: true

class UsersBoxSerializer < ActiveModel::Serializer
  attributes :id, :write_access
  belongs_to :user
  belongs_to :box
end
