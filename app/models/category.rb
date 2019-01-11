# frozen_string_literal: true

class Category < ApplicationRecord
  has_many :category_item_connections
  has_many :items, through: :category_item_connections
  validates :category, presence: true, length: { minimum: 3 }
end
