# frozen_string_literal: true

class Item < ApplicationRecord
  belongs_to :user
  belongs_to :box

  include PgSearch
  pg_search_scope :search_for,
                  against: :name,
                  using: { tsearch: { any_word: true, prefix: true } }
end
