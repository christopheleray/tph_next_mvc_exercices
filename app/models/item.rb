# frozen_string_literal: true

# == Schema Information
#
# Table name: items
#
#  id                  :bigint(8)        not null, primary key
#  original_price      :float            not null
#  has_discount        :boolean          default(FALSE)
#  discount_percentage :integer          default(0)
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#

class Item < ApplicationRecord

  has_many :category_item_connections
  has_many :category, through: :category_item_connections
  validates :name, presence: true, length: { minimum: 3 }
  validates :original_price, presence: true, numericality: true, allow_nil: false
  validates :has_discount, default: false
  validates :discount_percentage, 
            numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 100 }

  scope :sorted_by_price, -> { order("original_price ASC") }
  scope :newest_first, lambda { order("created_at DESC") }
  scope :with_discount, lambda { where(has_discount: true) }
  scope :without_discount, lambda { where(has_discount: false) }
  
  def price
    has_discount ? (original_price - ( original_price * discount_percentage / 100)).round(2) : original_price
  end

  def self.average_price
   Item.count > 0 ? Item.all.map(&:price).sum / Item.count : nil
  end

end
