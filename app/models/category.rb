class Category < ApplicationRecord
  has_many :category_item_connections
  has_many :items, through: :category_item_connections
end
