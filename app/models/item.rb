# frozen_string_literal: true

class Item < ApplicationRecord
  belongs_to :user
  belongs_to :box
  # has_many :users_boxes, through: :box
  # has_many :users, through: :users_boxes
end
