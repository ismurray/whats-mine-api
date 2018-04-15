# frozen_string_literal: true

class Box < ApplicationRecord
  belongs_to :user
  has_many :items, dependent: :destroy
end
