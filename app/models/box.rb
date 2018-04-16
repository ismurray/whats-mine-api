# frozen_string_literal: true

class Box < ApplicationRecord
  has_many :users_boxes, dependent: :destroy
  has_many :users, through: :users_boxes
  has_many :items, dependent: :destroy
end
