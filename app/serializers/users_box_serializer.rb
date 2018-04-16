# frozen_string_literal: true

class UsersBoxSerializer < ActiveModel::Serializer
  attributes :id, :write_access, :user, :box
  # belongs_to :user
  # belongs_to :box

  def box
    object.box.id
  end

  def user
    object.user.id
  end
end
