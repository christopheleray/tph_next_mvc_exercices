# frozen_string_literal: true

class Category < ApplicationRecord
  has_many :category_item_connections, dependent: :destroy
  has_many :items, through: :category_item_connections
  validates :name, presence: true, length: { minimum: 3 }
end
