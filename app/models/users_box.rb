# frozen_string_literal: true

class UsersBox < ApplicationRecord
  belongs_to :user
  belongs_to :box, inverse_of: :users_boxes
end
