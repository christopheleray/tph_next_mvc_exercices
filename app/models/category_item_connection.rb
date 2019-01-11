# frozen_string_literal: true

class CategoryItemConnection < ApplicationRecord
  belongs_to :category
  belongs_to :item
end
