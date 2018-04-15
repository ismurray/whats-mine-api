# frozen_string_literal: true

class User < ApplicationRecord
  include Authentication
  has_many :examples
  has_many :users_boxes
  has_many :boxes, through: :users_boxes
  has_many :items, through: :boxes
end
